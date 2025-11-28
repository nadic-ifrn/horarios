<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AnoLetivo;
use App\Turma;
use App\Curso;
use App\Periodo;

class TurmaController extends Controller
{
    
	public function listar($ano_letivo_id) {
		try {
			$ano = AnoLetivo::find($ano_letivo_id);
			return view('turma.listar', compact('ano'));
		} catch (\Exception $e) {
			return redirect()->route('ano_letivo.listar');
		}
	}

	public function excluir($id) {
		$turma = Turma::find($id);
		if ($turma != null) {
			try {
				$turma->delete();
				session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Turma excluída.']);
			} catch (\Exception $e) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Não foi possível excluir a turma, verifique se não há respostas de questionários relacionadas a esta turma.']);
			}
			return redirect()->route('turma.listar', ['ano_letivo_id' => $turma->ano_letivo->id]);
		}
		return redirect()->route('ano_letivo.listar');
	}

	public function editar($ano_letivo_id, $id = null) {
		$ano = AnoLetivo::find($ano_letivo_id);
		$periodos = Periodo::join('cursos', 'periodos.curso_id', '=', 'cursos.id')->orderBy('cursos.nome')->orderBy('ordem')->orderBy('nome')->get(['periodos.*']);
		$turma = new Turma();
		if ($id != null) {
			$turma = Turma::find($id);
		}
		return view('turma.form', compact('ano', 'periodos', 'turma'));
	}

	public function salvar(Request $request) {
		if ( empty($request->id) ) {
			$turma = new Turma($request->except('_token', 'id'));
			$turma->ano_letivo_id = $request->ano_letivo_id;
		} else {
			$turma = Turma::find($request->id);
			$turma->fill($request->except('_token', 'id'));
		}
		$turma->periodo_id = $request->periodo_id;
		try {
			$turma->save();
			session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Turma salva.']);
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Erro ao salvar turma, contate o administrador.']);
		}
		return redirect()->route('turma.listar', ['ano_letivo_id' => $turma->ano_letivo->id]);
	}

}
