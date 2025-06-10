<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use App\Professor;
use App\Curso;
use App\AnoLetivo;
use App\Periodo;
use App\Turma;
use App\Disciplina;
use App\Dia;
use App\Carga;
use App\Anexo;

class DatabaseController extends Controller
{
    private $tables = [
        'professors' => Professor::class,
        'cursos' => Curso::class,
        'ano_letivos' => AnoLetivo::class,
        'periodos' => Periodo::class,
        'turmas' => Turma::class,
        'disciplinas' => Disciplina::class,
        'dias' => Dia::class,
        'cargas' => Carga::class,
        'anexos' => Anexo::class,
    ];

    private $tableLabels = [
        'professors' => 'Professores',
        'cursos' => 'Cursos',
        'ano_letivos' => 'Anos Letivos',
        'periodos' => 'Períodos',
        'turmas' => 'Turmas',
        'disciplinas' => 'Disciplinas',
        'dias' => 'Dias',
        'cargas' => 'Cargas',
        'anexos' => 'Anexos',
    ];

    public function index()
    {
        return view('admin.db-editor.index', [
            'tables' => $this->tableLabels
        ]);
    }

    public function showTable($table)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $modelClass = $this->tables[$table];
        $columns = Schema::getColumnListing($table);
        $data = $modelClass::all();

        return view('admin.db-editor.table', [
            'table' => $table,
            'tableLabel' => $this->tableLabels[$table],
            'columns' => $columns,
            'data' => $data
        ]);
    }

    public function create($table)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $columns = Schema::getColumnListing($table);
        $foreignKeys = $this->getForeignKeys($table);

        return view('admin.db-editor.form', [
            'table' => $table,
            'tableLabel' => $this->tableLabels[$table],
            'columns' => $columns,
            'foreignKeys' => $foreignKeys,
            'data' => null,
            'action' => 'create'
        ]);
    }

    public function store(Request $request, $table)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $modelClass = $this->tables[$table];
        $data = $request->except(['_token', '_method']);

        // Remove timestamps automáticos
        unset($data['created_at'], $data['updated_at']);

        $model = new $modelClass();
        $model->fill($data);
        $model->save();

        return redirect()->route('db.table', $table)->with('success', 'Registro criado com sucesso!');
    }

    public function edit($table, $id)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $modelClass = $this->tables[$table];
        $columns = Schema::getColumnListing($table);
        $foreignKeys = $this->getForeignKeys($table);
        $data = $modelClass::findOrFail($id);

        return view('admin.db-editor.form', [
            'table' => $table,
            'tableLabel' => $this->tableLabels[$table],
            'columns' => $columns,
            'foreignKeys' => $foreignKeys,
            'data' => $data,
            'action' => 'edit'
        ]);
    }

    public function update(Request $request, $table, $id)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $modelClass = $this->tables[$table];
        $data = $request->except(['_token', '_method']);

        // Remove timestamps automáticos
        unset($data['created_at'], $data['updated_at']);

        $model = $modelClass::findOrFail($id);
        $model->fill($data);
        $model->save();

        return redirect()->route('db.table', $table)->with('success', 'Registro atualizado com sucesso!');
    }

    public function destroy($table, $id)
    {
        if (!array_key_exists($table, $this->tables)) {
            abort(404);
        }

        $modelClass = $this->tables[$table];
        $model = $modelClass::findOrFail($id);
        $model->delete();

        return redirect()->route('db.table', $table)->with('success', 'Registro excluído com sucesso!');
    }

    public function sqlExecutor()
    {
        return view('admin.sql-executor.index');
    }

    public function executeSql(Request $request)
    {
        $sql = $request->input('sql');
        $results = null;
        $error = null;

        try {
            // Para queries SELECT
            if (stripos(trim($sql), 'SELECT') === 0) {
                $results = DB::select($sql);
            } else {
                // Para queries INSERT, UPDATE, DELETE
                $affected = DB::statement($sql);
                $results = ['message' => 'Query executada com sucesso!', 'affected_rows' => $affected];
            }
        } catch (\Exception $e) {
            $error = $e->getMessage();
        }

        return view('admin.sql-executor.index', [
            'sql' => $sql,
            'results' => $results,
            'error' => $error
        ]);
    }

    private function getForeignKeys($table)
    {
        $foreignKeys = [];

        switch ($table) {
            case 'periodos':
                $foreignKeys['curso_id'] = Curso::pluck('nome', 'id');
                break;
            case 'turmas':
                $foreignKeys['periodo_id'] = Periodo::pluck('nome', 'id');
                $foreignKeys['ano_letivo_id'] = AnoLetivo::select(DB::raw("CONCAT(ano, '/', semestre) as display"), 'id')->pluck('display', 'id');
                break;
            case 'disciplinas':
                $foreignKeys['periodo_id'] = Periodo::pluck('nome', 'id');
                break;
            case 'dias':
                $foreignKeys['ano_letivo_id'] = AnoLetivo::select(DB::raw("CONCAT(ano, '/', semestre) as display"), 'id')->pluck('display', 'id');
                $foreignKeys['professor_id'] = Professor::pluck('nome', 'id');
                break;
            case 'cargas':
                $foreignKeys['turma_id'] = Turma::select(DB::raw("CONCAT('ID:', id, ' - ', turno) as display"), 'id')->pluck('display', 'id');
                $foreignKeys['disciplina_id'] = Disciplina::pluck('nome', 'id');
                $foreignKeys['dia_id'] = Dia::pluck('id', 'id');
                break;
            case 'anexos':
                $foreignKeys['dia_id'] = Dia::pluck('id', 'id');
                break;
        }

        return $foreignKeys;
    }
}
