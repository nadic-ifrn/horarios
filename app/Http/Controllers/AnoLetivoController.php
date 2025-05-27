<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AnoLetivo;
use App\Professor;
use App\Carga;
use App\Dia;
use App\Periodo;
use App\Turma;
use Config;

class AnoLetivoController extends Controller
{
    
	public function listar() {
		$anos = AnoLetivo::orderBy('ano')->orderBy('semestre')->get();
		session()->put('sessao', 'anoletivo');
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
		$anos = AnoLetivo::orderBy('ano', 'desc')->orderBy('semestre', 'desc')->get();
		session()->put('sessao', 'relatorios');
		return view('ano_letivo.relatorios', compact('anos'));
	}

	private function gerar_restricao_dias($professor_id, $ano_letivo_id) {
		$dia = Dia::where('professor_id', $professor_id)
				->where('ano_letivo_id', $ano_letivo_id)
				->first();
		$periodos = Config::get('app.periodos_m') + Config::get('app.periodos_t') + Config::get('app.periodos_n');
		$restr = '';
		$restr .= '.'.(($dia->seg) ? $this->gerar_valores_restricao($periodos, '1') : $this->gerar_valores_restricao($periodos, '0')).',';
		$restr .= '.'.(($dia->ter) ? $this->gerar_valores_restricao($periodos, '1') : $this->gerar_valores_restricao($periodos, '0')).',';
		$restr .= '.'.(($dia->qua) ? $this->gerar_valores_restricao($periodos, '1') : $this->gerar_valores_restricao($periodos, '0')).',';
		$restr .= '.'.(($dia->qui) ? $this->gerar_valores_restricao($periodos, '1') : $this->gerar_valores_restricao($periodos, '0')).',';
		$restr .= '.'.(($dia->sex) ? $this->gerar_valores_restricao($periodos, '1') : $this->gerar_valores_restricao($periodos, '0'));
		return $restr;
	}

	private function gerar_restricao_horarios($turma) {
		$restr_aux = '';
		$restr_aux .= '.'.(($turma->turno == 'M') ? $this->gerar_valores_restricao(Config::get('app.periodos_m'), '1') : $this->gerar_valores_restricao(Config::get('app.periodos_m'), '0'));
		$restr_aux .= ($turma->turno == 'T') ? $this->gerar_valores_restricao(Config::get('app.periodos_t'), '1') : $this->gerar_valores_restricao(Config::get('app.periodos_t'), '0');
		$restr_aux .= ($turma->turno == 'N') ? $this->gerar_valores_restricao(Config::get('app.periodos_n'), '1') : $this->gerar_valores_restricao(Config::get('app.periodos_n'), '0');
		$restr = '';
		for ($i=0; $i<5; $i++) {
			$restr .= $restr_aux;
			if ($i < 4) {
				$restr .= ',';
			}
		}
		return $restr;
	}

	private function gerar_valores_restricao($qtd, $valor) {
		$res = '';
		for ($i=0; $i<$qtd; $i++) {
			$res .= $valor;
		}
		return $res;
	}

	public function relatorio_exportar($id) {
		$xml = "<?xml version='1.0' encoding='utf-8'?>";
		$xml .= "<timetable importtype='database' options='idprefix:Horarios'>";
		$xml .= "<teachers options='canadd,canremove,canupdate' columns='id,name,timeoff'>";
		$professors = Professor::join('dias', 'dias.professor_id', '=', 'professors.id')
				->where("dias.ano_letivo_id", $id)
				->orderBy("professors.id")
				->get(['professors.*']);
		foreach ($professors as $professor) {
			$xml .= "<teacher id='{$professor->id}' name='{$professor->nome}' timeoff='".$this->gerar_restricao_dias($professor->id, $id)."'/>";
		}
		$xml .= "</teachers><classes options='canadd,canremove,canupdate' columns='id,name,timeoff'>";
		$turmas = Turma::join("periodos", "periodos.id", "=", "turmas.periodo_id")
				->join("cursos", "cursos.id", "=", "periodos.curso_id")
				->where('turmas.ano_letivo_id', $id)
				->orderBy("turmas.id")
				->get(['turmas.*']);
		foreach ($turmas as $turma) {
			$xml .= "<class id='{$turma->id}' name='{$turma->periodo->curso->sigla}.".explode('.', $turma->periodo->nome)[0]."{$turma->turno}' timeoff='".$this->gerar_restricao_horarios($turma)."' />";
		}
		$xml .= "</classes><subjects options='canadd,canremove,canupdate' columns='id,name'>";
		$periodos = Periodo::join('turmas', 'turmas.periodo_id', '=', 'periodos.id')
				->where('turmas.ano_letivo_id', $id)
				->orderBy('periodos.id')
				->get(['periodos.*']);
		foreach ($periodos as $periodo) {
			foreach ($periodo->disciplinas as $disciplina) {
				$xml .= "<subject id='{$disciplina->id}' name='{$disciplina->nome}'/>";
			}
		}
		$xml .= "</subjects><lessons options='canadd,canremove,canupdate' columns='id,subjectid,teacherid,classid,periodsperweek,durationperiods'>";
		$cargas = Carga::join('dias', 'dias.id', '=', 'cargas.dia_id')
				->join('turmas', 'turmas.id', '=', 'cargas.turma_id')
				->join('disciplinas', 'disciplinas.id', '=', 'cargas.disciplina_id')
				->where('turmas.ano_letivo_id', $id)->where('dias.ano_letivo_id', $id)
				->orderBy('cargas.id')
				->get(['cargas.*']);
		foreach ($cargas as $carga) {
			$qtd = floor($carga->disciplina->ch_semanal / 2) * 2;
			$impar = $carga->disciplina->ch_semanal % 2 == 1;
			$xml .= "<lesson id='{$carga->id}' subjectid='{$carga->disciplina_id}' teacherid='{$carga->dia->professor_id}' classid='{$carga->turma_id}' periodsperweek='{$qtd}' durationperiods='2' />";
			if ($impar) {
				$xml .= "<lesson id='{$carga->id}' subjectid='{$carga->disciplina_id}' teacherid='{$carga->dia->professor_id}' classid='{$carga->turma_id}' periodsperweek='1' durationperiods='1' />";
			}
		}
		$xml .= "</lessons></timetable>";
		$ano = AnoLetivo::find($id);
		return response($xml)->withHeaders([
			"Content-Type" => "text/xml",
			"Content-Disposition" => "attachment; filename=\"db_{$ano->ano}_{$ano->semestre}.xml\""
		]);
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
