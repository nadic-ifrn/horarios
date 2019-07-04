@extends('template')

@section('titulo', 'Exportação para o TimeTables do Questionário para o Período '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Dados de exportação para o TimeTables do questionário para o período {{ $ano->ano }}.{{ $ano->semestre }}
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('AnoLetivoController@relatorios') }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<table id="results" data-tableName="TimeTables Data" class="table table-hover">
			<thead>
				<tr>
					<th>Professor</th>
					<th>Turma</th>
					<th>Disciplina</th>
					<th>Aulas por semana</th>
					<th>Duração</th>
				</tr>
			</thead>
			<tbody>
				@forelse($cargas as $carga)
					@php($qtd = floor($carga->disciplina->ch_semanal / 2))
					@php($impar = $carga->disciplina->ch_semanal % 2 == 1)
					<tr>
						<td>{{ $carga->dia->professor->nome }}</td>
						<td>{{ $carga->turma->periodo->curso->sigla }}.{{ substr($carga->turma->periodo->nome, 0, 1) }}{{ $carga->turma->turno }}</td>
						<td>{{ $carga->disciplina->nome }}</td>
						<td>{{ $qtd }}</td>
						<td>2</td>
					</tr>
					@if($impar)
					<tr>
						<td>{{ $carga->dia->professor->nome }}</td>
						<td>{{ $carga->turma->periodo->curso->sigla }}.{{ substr($carga->turma->periodo->nome, 0, 1) }}{{ $carga->turma->turno }}</td>
						<td>{{ $carga->disciplina->nome }}</td>
						<td>1</td>
						<td>1</td>
					</tr>
					@endif
				@empty
				<tr>
					<td colspan="5">Não há dados para este período.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="#" class="btn btn-success" data-clipboard-target="#results">Copiar para Área de Transferência</a>
		</div>
	</div>
</div>

@endsection

@section('js')

<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.16/clipboard.min.js"></script>
<script>
	var clipboard = new Clipboard('.btn');
	clipboard.on('success', function(e) {
	  e.clearSelection();
	});
</script>

@endsection