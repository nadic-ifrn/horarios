@extends('template')

@section('titulo', 'Períodos Letivos')

@section('conteudo')

<h4>Períodos Letivo da Instituição</h4>
<div class="card">
	<div class="card-body">
		<ul class="list-unstyled">
			<li>Período letivo permite a abertura de novo questionário;</li>
			<li><b class="badge badge-warning">Atenção</b> Somente é possível a exclusão de períodos letivos que não  possuam turmas registradas;</li>
		</ul>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Período</th>
					<th>Situação</th>
					<th width="400px"></th>
				</tr>
			</thead>
			<tbody>
				@forelse($anos as $ano)
				<tr>
					<td>{{ $ano->ano }}.{{ $ano->semestre }}</td>
					<td>
						@if ($ano->concluido)
						<span class="badge badge-danger">Fechado</span>
						@else
						<span class="badge badge-success">Aberto</span>
						@endif
					<td>
						<a href="{{ action('AnoLetivoController@excluir', ['id' => $ano->id]) }}" class="btn btn-danger excluir">Excluir</a>
						<a href="{{ action('AnoLetivoController@editar', ['id' => $ano->id]) }}" class="btn btn-warning">Editar</a>
						<a href="{{ action('TurmaController@listar', ['ano_letivo_id' => $ano->id]) }}" class="btn btn-link">Listar Turmas</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="3">Não há ano letivo nesta instituição.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('AnoLetivoController@editar') }}" class="btn btn-success">Adicionar Novo Período Letivo</a>
		</div>
	</div>
</div>

@endsection

@section('js')

<script>
	$(function(){
		$('.excluir').on('click', function(e) {
			if (!confirm('Deseja realmente excluir?')) {
				e.preventDefault();
			}
		});
	});
</script>

@endsection