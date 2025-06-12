<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\AnoLetivo;
use App\Professor;
use App\Turma;
use App\Disciplina;
use App\Carga;
use App\Dia;
use App\Anexo;

class QuestionarioController extends Controller
{
    
	public function responder($id) {
		$ano = AnoLetivo::find($id);
		if ($ano != null && !$ano->concluido) {
			$dia = Dia::where('ano_letivo_id', $ano->id)->where('professor_id', session()->get('usuario')->id)
					->first();
			return view('questionario.questionario', compact('ano', 'dia'));
		}
		return redirect('/');
	}

	public function submeter(Request $request) {
		$ano = AnoLetivo::find($request->id);

		if ($ano != null && !$ano->concluido) {
			$professor = session()->get('usuario');

			// Persistência do registro de Dia
			$dia = Dia::where('ano_letivo_id', $ano->id)->where('professor_id', $professor->id)->first();
			if ($dia == null) {
				$dia = new Dia();
				$dia->professor()->associate(session()->get('usuario'));
				$dia->ano_letivo()->associate($ano);
			}
			$dados = $request->except('_token');
			if ($dados['q1'] == 1) {
				$dia->fill(['seg' => true, 'ter' => true, 'qua' => true, 'qui' => false, 'sex' => false,
						'especial' => false, 'observacao' => $dados['q3']]);
			} else if ($dados['q1'] == 2) {
				$dia->fill(['seg' => false, 'ter' => false, 'qua' => true, 'qui' => true, 'sex' => true,
						'especial' => false, 'observacao' => $dados['q3']]);
			} else {
				$dia->fill([
					'seg' => (array_search('seg', $dados['q1_1']) !== false ? true : false),
					'ter' => (array_search('ter', $dados['q1_1']) !== false ? true : false),
					'qua' => (array_search('qua', $dados['q1_1']) !== false ? true : false),
					'qui' => (array_search('qui', $dados['q1_1']) !== false ? true : false),
					'sex' => (array_search('sex', $dados['q1_1']) !== false ? true : false),
					'especial' => true, 'observacao' => $dados['q3']
				]);
			}
			$dia->save();
			$anexo = Anexo::where('dia_id', $dia->id)->first();
			if ($anexo != null) {
				Storage::delete($anexo->local);
				$anexo->delete();
			}
			if ($request->hasFile('q4')) {
				$local = Storage::putFile('public', $request->file('q4'), 'public');
				$anexo = new Anexo(['local' => $local, 'comentario' => $dados['q4_comentario'] ?? '']);
				$dia->anexo()->save($anexo);
			}

			// Persistência das disciplinas e turmas
			Carga::where('dia_id', $dia->id)->delete();
			for ($i = 0; $i < sizeof($dados['q2_d']); $i++) {
				$disciplina = Disciplina::find($dados['q2_d'][$i]);
				$turma = Turma::find($dados['q2_t'][$i]);
				if ($disciplina != null && $turma != null) {
					$carga = new Carga();
					$carga->turma()->associate($turma);
					$carga->disciplina()->associate($disciplina);
					$carga->dia()->associate($dia);
					$carga->save();
				}
			}

			session()->flash('flash', ['tipo' => 'success', 'mensagem' => "Questionário submetido com sucesso, obrigado."]);
		} else if ($ano->concluido) {
			session()->flash('flash', ['tipo' => 'danger', 'mensagem' => "Este período já está fechado, não é permitido mais envio de questionário."]);
		}
		return redirect('/');
	}

	public function listar($idAnoLetivo) {
		$ano = AnoLetivo::find($idAnoLetivo);
		if ($ano != null) {
			return view('questionario.listar', compact('ano'));
		}
		return redirect('/');
	}

	public function detalhar($id) {
		$dia = Dia::find($id);
		if ($dia != null && ($dia->professor->id == session()->get('usuario')->id || session()->get('usuario')->comissao)) {
			return view('questionario.detalhar', compact('dia'));
		}
		return redirect('/');
	}

}
