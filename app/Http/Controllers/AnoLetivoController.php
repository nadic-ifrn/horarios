<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AnoLetivo;
use App\Carga;

class AnoLetivoController extends Controller
{
    
	public function listar() {
		$anos = AnoLetivo::orderBy('ano')->orderBy('semestre')->get();
		return view('ano_letivo.listar', compact('anos'));
	}

	public function excluir($id) {
		$ano = AnoLetivo::find($id);
		if ($ano != null) {
			try {
				$ano->delete();
				session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Período letivo excluído.']);
			} catch (\Exception $e) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Não foi possível excluir o período letivo, verifique se não há dependências de turmas para este registro.']);
			}
		}
		return redirect()->action('AnoLetivoController@listar');
	}

	public function editar($id = null) {
		$ano = new AnoLetivo();
		if ($id != null) {
			$ano = AnoLetivo::find($id);
		}
		return view('ano_letivo.form', compact('ano'));
	}

	public function salvar(Request $request) {
		if ( empty($request->id) ) {
			$ano = new AnoLetivo($request->except('_token', 'id'));
		} else {
			$ano = AnoLetivo::find($request->id);
			$ano->fill($request->except('_token', 'id'));
		}
		try {
			$ano->save();
			session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Período letivo salvo.']);
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Erro ao salvar período letivo, contate o administrador.']);
		}
		return redirect()->action('AnoLetivoController@listar');
	}

	public function relatorios() {
		$anos = AnoLetivo::orderBy('ano')->orderBy('semestre')->get();
		return view('ano_letivo.relatorios', compact('anos'));
	}

	public function relatorio_respostas($id) {
		$ano = AnoLetivo::find($id);
		return view('ano_letivo.relatorio_resposta', compact('ano'));
	}

	public function relatorio_timetables($id) {
		$ano = AnoLetivo::find($id);
		$cargas = Carga::join('dias', 'dias.id', '=', 'cargas.dia_id')
			->join('professors', 'professors.id', '=', 'dias.professor_id')
			->join('disciplinas', 'disciplinas.id', '=', 'cargas.disciplina_id')
			->join('turmas', 'turmas.id', '=', 'cargas.turma_id')
			->join('periodos', 'periodos.id', '=', 'turmas.periodo_id')
			->join('cursos', 'cursos.id', 'periodos.curso_id')
			->where('dias.ano_letivo_id', $ano->id)
			->orderBy('professors.nome')
			->get(['cargas.*']);
		return view('ano_letivo.relatorio_timetables', compact('ano', 'cargas'));
	}

}
