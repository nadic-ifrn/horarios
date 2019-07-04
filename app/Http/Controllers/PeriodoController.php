<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Curso;
use App\Periodo;

class PeriodoController extends Controller
{
   	
	public function listar($curso_id) {
		try {
			$curso = Curso::find($curso_id);
			return view('periodo.listar', compact('curso'));
		} catch (\Exception $e) {
			return redirect()->action('CursoController@listar');
		}
	}

	public function excluir($id) {
		$periodo = Periodo::find($id);
		if ($periodo != null) {
			try {
				$periodo->delete();
				session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Período excluído.']);
			} catch (\Exception $e) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Não foi possível excluir o período, verifique se não há dependências de disciplinas para este registro.']);
			}
			return redirect()->action('PeriodoController@listar', ['curso_id' => $periodo->curso->id]);
		}
		return redirect()->action('CursoController@listar');
	}

	public function editar($curso_id, $id = null) {
		$curso = Curso::find($curso_id);
		$periodo = new Periodo();
		if ($id != null) {
			$periodo = Periodo::find($id);
		}
		return view('periodo.form', compact('curso', 'periodo'));
	}

	public function salvar(Request $request) {
		if ( empty($request->id) ) {
			$periodo = new Periodo($request->except('_token', 'id'));
			$periodo->curso_id = $request->curso_id;
		} else {
			$periodo = Periodo::find($request->id);
			$periodo->fill($request->except('_token', 'id'));
		}
		try {
			$periodo->save();
			session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Período salvo.']);
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Erro ao salvar período, contate o administrador.']);
		}
		return redirect()->action('PeriodoController@listar', ['curso_id' => $periodo->curso->id]);
	}

}
