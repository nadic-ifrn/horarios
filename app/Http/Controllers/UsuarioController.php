<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Ivmelo\SUAP\SUAP;
use App\Professor;

class UsuarioController extends Controller
{
    
	public function autenticar(Request $request) {
		$suap = new SUAP();
		$token = $suap->autenticar($request->matricula, $request->senha);
		if ($token) {
			$dados = $suap->getMeusDados();
			if ($dados['vinculo']['categoria'] == 'docente' && $dados['vinculo']['campus'] == 'CN') {
				$usuario = Professor::where('matricula', $request->matricula)->first();
				if ($usuario == null) {
					$usuario = new Professor(['nome' => $dados['nome_usual'], 'matricula' => $dados['matricula']]);
					$usuario->save();
				}
				session()->put('usuario', $usuario);
			} else {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Você não é docente e/ou não pertence ao campus CN.']);
			}
		} else {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Matrícula e/ou senha inválido(s).']);
		}
		return redirect('/');
	}

	public function sair() {
		session()->forget('usuario');
		return redirect('/');
	}

}
