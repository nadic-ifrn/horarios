<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Classes\SUAPClient;
use App\Professor;
use Illuminate\Support\Facades\Config;
use Exception;

class UsuarioController extends Controller
{
	public function autenticar(Request $request)
	{
		$suap = new SUAPClient();

		try {
			$usuario = Professor::where('matricula', $request->matricula)->first();
			if ($usuario == null) {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Usuário não autorizado a acessar o sistema.']);
				return redirect('/');
			}

			$token = $suap->autenticar($request->matricula, $request->senha);
			$dados = $suap->getMeusDados();
			if ($dados['vinculo']['campus'] == Config::get('app.campus')) {
				if ($usuario->nome !== $dados['nome_usual']) {
					$usuario->nome = $dados['nome_usual'];
					$usuario->save();
				}
				session()->put('usuario', $usuario);
			} else {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Você não pertence ao campus ' . Config::get('app.campus') . '.']);
			}
		} catch (\Exception $e) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Matrícula e/ou senha inválido(s).']);
		}
		return redirect('/');
	}
	public function sair()
	{
		session()->forget('usuario');
		return redirect('/');
	}

	public function entrar(Request $request)
	{
		$matricula = $request->input('matricula');
		$senha = $request->input('senha');

		try {
			$usuario = Professor::where('matricula', $matricula)->first();
			if ($usuario == null) {
				return response()->json(['erro' => 'Usuário não autorizado a acessar o sistema.'], 403);
			}

			$suap = new SUAPClient();
			$resultado = $suap->autenticar($matricula, $senha);

			if ($resultado) {
				$dados = $suap->getMeusDados();
				$campusConfig = Config::get('app.campus');
				if ($dados['vinculo']['campus'] == $campusConfig) {
					if ($usuario->nome !== $dados['nome_usual']) {
						$usuario->nome = $dados['nome_usual'];
						$usuario->save();
					}
					session()->put('usuario', $usuario);
				} else {
					return response()->json(['erro' => 'Você não pertence ao campus ' . $campusConfig . '.'], 422);
				}
			} else {
				return response()->json(['erro' => 'Matrícula e/ou senha inválido(s).'], 422);
			}
		} catch (Exception $e) {
			return response()->json(['erro' => 'Erro interno do servidor.'], 500);
		}
	}
}
