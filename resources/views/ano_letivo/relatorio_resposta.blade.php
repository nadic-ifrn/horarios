@extends('template')

@section('titulo', 'Relatório de Respostas do Questionário para o Período '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<h4>Respostas ao Questionário do Período Letivo {{ $ano->ano }}.{{ $ano->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Matrícula</th>
					<th>Professor</th>
					<th>SEG</th>
					<th>TER</th>
					<th>QUA</th>
					<th>QUI</th>
					<th>SEX</th>
					<th>Observação</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@forelse($ano->dias()->join('professors', 'professors.id', '=', 'dias.professor_id')->orderBy('dias.seg')->orderBy('professors.nome')->get(['dias.*']) as $dia)
				<tr>
					<td>{{ $dia->professor->matricula }}</td>
					<td>{{ $dia->professor->nome }}</td>
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
					<td>{{ $dia->observacao }}</td>
					<td>
						<a href="{{ action('QuestionarioController@detalhar', ['id' => $dia->id]) }}" class="btn btn-link">Detalhar</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="8">Não há respostas para este período.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('AnoLetivoController@relatorios') }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
		</div>
	</div>
</div>

@endsection