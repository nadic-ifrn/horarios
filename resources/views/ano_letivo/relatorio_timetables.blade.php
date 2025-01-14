@extends('template')

@section('titulo', 'Exportação para o TimeTables do Questionário para o Período '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<h4>Dados de Exportação do Período {{ $ano->ano }}.{{ $ano->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<ul class="list-unstyled">
			<li><b class="badge badge-warning">Atenção</b> A exportação funciona apenas para o software Asc Timetables.</li>
		</ul>
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
			<a href="{{ action('AnoLetivoController@relatorios') }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
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
	  alert("Dados copiados para a Área de Transferência!\nAbra o TimeTables e escolha a função " +
	  		"\"Importar -> Importar da Área de Transferência (ou Clipboard)\", em seguida escolha a opção \"Lessons (Aulas)\" marque a opção " +
			"\"Primeira linha contém o cabeçalho\", observe se a grade foi preenchida. Clique em \"Importar\"");
	});
</script>

@endsection