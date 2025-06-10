<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class SecretController extends Controller
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

    public function index()
    {
        $professores = DB::table('professors')->get();

        return view('secret.professores', compact('professores'));
    }

    public function toggleComissao($id)
    {
        $professor = DB::table('professors')->where('id', $id)->first();

        if ($professor) {
            DB::table('professors')
                ->where('id', $id)
                ->update(['comissao' => !$professor->comissao]);
        }

        return redirect()->back()->with('success', 'comissão atualizado');
    }


    public function dbEditor()
    {
        $tables = [];
        foreach ($this->allowedTables as $table) {
            $count = DB::table($table)->count();
            $tables[] = [
                'name' => $table,
                'count' => $count
            ];
        }

        return view('secret.db-editor', compact('tables'));
    }

    public function showTable($table)
    {
        if (!in_array($table, $this->allowedTables)) {
            return redirect()->back()->with('error', 'Tabela não permitida');
        }

        $columns = Schema::getColumnListing($table);
        $data = DB::table($table)->paginate(20);

        return view('secret.table-view', compact('table', 'columns', 'data'));
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

        return view('secret.table-create', compact('table', 'columns'));
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
            return redirect()->route('secret.table', $table)->with('success', 'Registro criado com sucesso');
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
            return redirect()->route('secret.table', $table)->with('error', 'Registro não encontrado');
        }

        $editableColumns = array_filter($columns, function ($col) {
            return !in_array($col, ['id', 'created_at', 'updated_at']);
        });

        return view('secret.table-edit', compact('table', 'record', 'editableColumns'));
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
            return redirect()->route('secret.table', $table)->with('success', 'Registro atualizado com sucesso');
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
            return redirect()->route('secret.table', $table)->with('success', 'Registro excluído com sucesso');
        } catch (\Exception $e) {
            return back()->with('error', 'Erro ao excluir registro: ' . $e->getMessage());
        }
    }

    public function sqlExecutor()
    {
        return view('secret.sql-executor');
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

        return view('secret.sql-executor', compact('sql', 'results', 'error'));
    }
}
