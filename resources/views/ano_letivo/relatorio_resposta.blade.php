@extends('template')

@section('titulo', 'Relatório de Respostas do Questionário para o Período '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Respostas ao questionário para o período {{ $ano->ano }}.{{ $ano->semestre }}
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('AnoLetivoController@relatorios') }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
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
				</tr>
				@empty
				<tr>
					<td colspan="8">Não há respostas para este período.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
	</div>
</div>

@endsection