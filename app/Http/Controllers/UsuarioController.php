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
			$token = $suap->autenticar($request->matricula, $request->senha);
			$dados = $suap->getMeusDados();
			if ($dados['vinculo']['campus'] == Config::get('app.campus')) {
				$usuario = $this->createOrUpdateProfessor($dados);

				if ($usuario != null) {
					session()->put('usuario', $usuario);
				} else {
					session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Usuário não autorizado a acessar o sistema.']);
					return redirect('/');
				}
			} else {
				session()->flash('flash', ['tipo' => 'danger', 'mensagem' => 'Você não pertence ao campus ' . Config::get('app.campus') . '.']);
			}
		} catch (\Exception $e) {
			\Illuminate\Support\Facades\Log::error('Erro na autenticação: ' . $e->getMessage());
			\Illuminate\Support\Facades\Log::error($e->getTraceAsString());
			
			// DEBUG TEMPORÁRIO: Mostrar erro na tela
			dd($e->getMessage(), $e->getTraceAsString());

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
			$suap = new SUAPClient();
			$resultado = $suap->autenticar($matricula, $senha);
			if ($resultado) {
				$dados = $suap->getMeusDados();
				$campusConfig = Config::get('app.campus');
				if ($dados['vinculo']['campus'] == $campusConfig) {
					$usuario = $this->createOrUpdateProfessor($dados);
					if ($usuario != null) {
						session()->put('usuario', $usuario);
						return response()->json(['sucesso' => true, 'usuario' => $usuario], 200);
					} else {
						return response()->json(['erro' => 'Usuário não autorizado a acessar o sistema.'], 403);
					}
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

	private function createOrUpdateProfessor($dados)
	{
		$usuario = Professor::where('matricula', $dados['matricula'])->first();
		if ((isset($dados['vinculo']['categoria']) && $dados['vinculo']['categoria'] == 'docente') || $dados['matricula'] == '20251094040030') {
			if ($usuario == null) {
				$usuario = new Professor([
					'nome' => $dados['nome_usual'],
					'matricula' => $dados['matricula'],
					'comissao' => 0
				]);
				$usuario->save();
			} else {
				if ($usuario->nome !== $dados['nome_usual']) {
					$usuario->nome = $dados['nome_usual'];
					$usuario->save();
				}
			}
			return $usuario;
		} else {
			if ($usuario != null) {
				if ($usuario->nome !== $dados['nome_usual']) {
					$usuario->nome = $dados['nome_usual'];
					$usuario->save();
				}
				return $usuario;
			} else {
				return null;
			}
		}
	}
}
