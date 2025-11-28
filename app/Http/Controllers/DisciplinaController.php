<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Turma;
use App\Periodo;
use App\Disciplina;

class DisciplinaController extends Controller
{
    
	public function listar_json($turma_id) {
		$disciplinas = [];
		$turma = Turma::find($turma_id);
		if ($turma != null) {
			$disciplinas = $turma->periodo->disciplinas()->orderBy('nome')->get();
		}
		return response()->json($disciplinas);
	}

	public function listar($periodo_id) {
		try {
			$periodo = Periodo::find($periodo_id);
			return view('disciplina.listar', compact('periodo'));
		} catch (\Exception $e) {
			return redirect()->route('curso.listar');
		}
	}

	public function excluir($id) {
		$disciplina = Disciplina::find($id);
		if ($disciplina != null) {
			try {
				$disciplina->delete();
				session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Disciplina excluída.']);
			} catch (\Exception $e) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Não foi possível excluir a disciplina, verifique se não há dependências de professores que responderam o questionário e utilizaram esta disciplina na resposta.']);
			}
			return redirect()->route('disciplina.listar', ['periodo_id' => $disciplina->periodo->id]);
		}
		return redirect()->route('curso.listar');
	}

	public function editar($periodo_id, $id = null) {
		$periodo = Periodo::find($periodo_id);
		$disciplina = new Disciplina();
		if ($id != null) {
			$disciplina = Disciplina::find($id);
		}
		return view('disciplina.form', compact('periodo', 'disciplina'));
	}

	public function salvar(Request $request) {
		if ( empty($request->id) ) {
			$disciplina = new Disciplina($request->except('_token', 'id'));
			$disciplina->periodo_id = $request->periodo_id;
		} else {
			$disciplina = Disciplina::find($request->id);
			$disciplina->fill($request->except('_token', 'id'));
		}
		try {
			$disciplina->save();
			session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Disciplina salva.']);
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Erro ao salvar disciplina, contate o administrador.']);
		}
		return redirect()->route('disciplina.listar', ['periodo_id' => $disciplina->periodo->id]);
	}

}
