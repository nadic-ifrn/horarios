@extends('template')

@section('titulo', 'Detalhes Questionário '.$dia->ano_letivo->ano.'.'.$dia->ano_letivo->semestre)

@section('conteudo')

<h4>Detalhes de Questionário {{ $dia->ano_letivo->ano }}.{{ $dia->ano_letivo->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<ul class="list-unstyled">
			<li>Questionario do(a) professor(a) <b>{{ $dia->professor->nome }}</b>.</li>
		</ul>
		<h5>1. Dias da semana</h5>
		<table class="table">
			<thead>
				<tr>
					<th>SEG</th>
					<th>TER</th>
					<th>QUA</th>
					<th>QUI</th>
					<th>SEX</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						@if($dia->seg)
						<span class="badge badge-lg badge-success badge-pill">OK</span>
						@endif
					</td>
					<td>
						@if($dia->ter)
						<span class="badge badge-lg badge-success badge-pill">OK</span>
						@endif
					</td>
					<td>
						@if($dia->qua)
						<span class="badge badge-lg badge-success badge-pill">OK</span>
						@endif
					</td>
					<td>
						@if($dia->qui)
						<span class="badge badge-lg badge-success badge-pill">OK</span>
						@endif
					</td>
					<td>
						@if($dia->sex)
						<span class="badge badge-lg badge-success badge-pill">OK</span>
						@endif
					</td>
				</tr>
			</tbody>
		</table>
		@if($dia->especial)
		<h5>1.1. Regime Diferenciado (Anexo)</h5>
		<p><a href="{{ action('AnexoController@visualizar', ['id' => $dia->anexo->id]) }}" target="_autoblank" class="card-link">Clique aqui</a> para visualizar o arquivo de autorização para regime diferenciado ({{ $dia->anexo->comentario }}).</p>
		@endif
		<h5>2. Disciplinas</h5>
		<table class="table">
			<thead>
				<tr>
					<th>Turma</th>
					<th>Disciplina</th>
					<th>CH Semanal</th>
				</tr>
			</thead>
			<tbody>
				@foreach($dia->cargas as $carga)
				<tr>
					<td>{{ $carga->turma->periodo->curso->sigla }}.{{ substr($carga->turma->periodo->nome, 0, 1) }}{{ $carga->turma->turno }}</td>
					<td>{{ $carga->disciplina->nome }}</td>
					<td>{{ $carga->disciplina->ch_semanal }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		<h5>3. Observação</h5>
		<p>
			@if($dia->observacao)
			{{ $dia->observacao }}
			@else
			Não há.
			@endif
		</p>
		<div class="text-right">
			<a href="{{ action('QuestionarioController@listar', ['idAnoLetivo' => $dia->ano_letivo->id]) }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
		</div>
	</div>
</div>

@endsection