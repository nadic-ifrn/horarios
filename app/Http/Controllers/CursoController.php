<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Curso;

class CursoController extends Controller
{
    
	public function listar() {
		$cursos = Curso::orderBy('nome')->get();
		return view('curso.listar', compact('cursos'));
	}

	public function excluir($id) {
		$curso = Curso::find($id);
		if ($curso != null) {
			try {
				$curso->delete();
				session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Curso excluído.']);
			} catch (\Exception $e) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Não foi possível excluir o curso, verifique se não há dependências de períodos para este registro.']);
			}
		}
		return redirect()->action('CursoController@listar');
	}

	public function editar($id = null) {
		$curso = new Curso();
		if ($id != null) {
			$curso = Curso::find($id);
		}
		return view('curso.form', compact('curso'));
	}

	public function salvar(Request $request) {
		if ( empty($request->id) ) {
			$curso = new Curso($request->except('_token', 'id'));
		} else {
			$curso = Curso::find($request->id);
			$curso->fill($request->except('_token', 'id'));
		}
		try {
			$curso->save();
			session()->flash('flash', ['tipo' => 'success', 'mensagem' => 'Curso salvo.']);
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Erro ao salvar curso, contate o administrador.']);
		}
		return redirect()->action('CursoController@listar');
	}

}
