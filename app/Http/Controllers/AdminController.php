<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AdminController extends Controller
{
    private $allowedTables = [
        'professors',
        'cursos',
        'ano_letivos',
        'periodos',
        'turmas',
        'disciplinas',
        'dias',
        'cargas',
        'anexos'
    ];

    public function usuarios()
    {
        $professores = DB::table('professors')->get();
        return view('admin.usuarios', compact('professores'));
    }

    public function toggleComissao($id)
    {
        $professor = DB::table('professors')->where('id', $id)->first();

        if ($professor) {
            DB::table('professors')
                ->where('id', $id)
                ->update(['comissao' => !$professor->comissao]);
        }
        return redirect()->back()->with('success', 'Status de comissão atualizado');
    }

    public function dbEditor()
    {
        session()->put('sessao', 'admin');

        $tables = [];
        foreach ($this->allowedTables as $table) {
            $count = DB::table($table)->count();
            $tables[] = [
                'name' => $table,
                'count' => $count
            ];
        }

        return view('admin.db-editor', compact('tables'));
    }

    public function showTable($table)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $columns = Schema::getColumnListing($table);
        $data = DB::table($table)->paginate(20);

        return view('admin.table-view', compact('table', 'columns', 'data'));
    }

    public function createRecord($table)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $columns = Schema::getColumnListing($table);
        $columns = array_filter($columns, function ($col) {
            return !in_array($col, ['id', 'created_at', 'updated_at']);
        });

        return view('admin.table-create', compact('table', 'columns'));
    }

    public function storeRecord(Request $request, $table)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $data = $request->except(['_token']);
        $data['created_at'] = now();
        $data['updated_at'] = now();

        try {
            DB::table($table)->insert($data);
            return redirect()->route('admin.table', $table)->with('success', 'Registro criado com sucesso');
        } catch (\Exception $e) {
            return back()->withInput()->with('error', 'Erro ao criar registro: ' . $e->getMessage());
        }
    }

    public function editRecord($table, $id)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $columns = Schema::getColumnListing($table);
        $record = DB::table($table)->where('id', $id)->first();

        if (!$record) {
            return redirect()->route('admin.table', $table)->with('error', 'Registro não encontrado');
        }

        $editableColumns = array_filter($columns, function ($col) {
            return !in_array($col, ['id', 'created_at', 'updated_at']);
        });

        return view('admin.table-edit', compact('table', 'record', 'editableColumns'));
    }

    public function updateRecord(Request $request, $table, $id)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $data = $request->except(['_token', '_method']);
        $data['updated_at'] = now();

        try {
            DB::table($table)->where('id', $id)->update($data);
            return redirect()->route('admin.table', $table)->with('success', 'Registro atualizado com sucesso');
        } catch (\Exception $e) {
            return back()->withInput()->with('error', 'Erro ao atualizar registro: ' . $e->getMessage());
        }
    }

    public function destroyRecord($table, $id)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        try {
            DB::table($table)->where('id', $id)->delete();
            return redirect()->route('admin.table', $table)->with('success', 'Registro excluído com sucesso');
        } catch (\Exception $e) {
            return back()->with('error', 'Erro ao excluir registro: ' . $e->getMessage());
        }
    }

    public function sqlExecutor()
    {
        return view('admin.sql-executor');
    }

    public function executeSql(Request $request)
    {
        $sql = $request->input('sql');
        $results = null;
        $error = null;

        if (empty($sql)) {
            return back()->with('error', 'Digite uma consulta SQL');
        }

        try {
            $results = DB::select($sql);
        } catch (\Exception $e) {
            $error = $e->getMessage();
        }

        return view('admin.sql-executor', compact('sql', 'results', 'error'));
    }

    public function exportAllTables()
    {
        $sqlStatements = [];
        $sqlStatements[] = "-- Export de todas as tabelas do banco de dados";
        $sqlStatements[] = "-- Gerado em: " . now()->format('Y-m-d H:i:s');
        $sqlStatements[] = "";
        foreach ($this->allowedTables as $table) {
            try {
                $data = DB::table($table)->get();

                if ($data->count() > 0) {
                    $sqlStatements[] = "-- Dados da tabela: {$table}";

                    $columns = Schema::getColumnListing($table);
                    $columnsString = implode(', ', array_map(function ($col) {
                        return "`{$col}`";
                    }, $columns));

                    foreach ($data as $record) {
                        $values = [];
                        foreach ($columns as $column) {
                            $value = $record->$column;
                            if (is_null($value)) {
                                $values[] = 'NULL';
                            } elseif (is_string($value)) {
                                $values[] = "'" . addslashes($value) . "'";
                            } elseif (is_bool($value)) {
                                $values[] = ($value ? '1' : '0');
                            } else {
                                $values[] = $value;
                            }
                        }

                        $valuesString = implode(', ', $values);
                        $sqlStatements[] = "INSERT INTO `{$table}` ({$columnsString}) VALUES ({$valuesString});";
                    }

                    $sqlStatements[] = "";
                }
            } catch (\Exception $e) {
                $sqlStatements[] = "-- Erro ao exportar tabela {$table}: " . $e->getMessage();
                $sqlStatements[] = "";
            }
        }

        $fullSql = implode("\n", $sqlStatements);

        return view('admin.sql-executor', [
            'sql' => $fullSql,
            'results' => null,
            'error' => null,
            'exported' => true
        ]);
    }
}
