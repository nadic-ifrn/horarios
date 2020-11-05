@extends('template')

@section('titulo', 'Períodos do Curso '.$curso->nome)

@section('conteudo')

<h4>Períodos do Curso {{ $curso->nome }}</h4>
<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6 text-right">
				
			</div>
		</div> 
	</div>
	<div class="card-body">
		<ul class="list-unstyled">
			<li>O período é formado por dois campos: <b>Ordem</b> e <b>Nome</b>;</li>
			<li>O campo Ordem deve seguir a ordem cronológica dos períodos;</li>
			<li>O campo Nome deve descrever o período, geralmente se utiliza o próprio período para descrevê-lo, quando este for semestral (ex: 1 representaria o 1º semestre). Em caso de período anual, utiliza-se ano e período separados por ponto (ex: 1.2 representaria o 1º ano 2º semestre);</li>
			<li><b class="badge badge-warning">Atenção</b> Somente é possível a exclusão de períodos que não possuam disciplinas registradas;</li>
		</ul>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Ordem</th>
					<th>Nome</th>
					<th>Carga Horária</th>
					<th width="400px"></th>
				</tr>
			</thead>
			<tbody>
				@forelse($curso->periodos()->orderBy('ordem')->get() as $periodo)
				<tr>
					<td>{{ $periodo->ordem }}</td>
					<td>{{ $periodo->nome }}</td>
					<td>{{ $periodo->disciplinas()->sum('ch_semanal') }}</td>
					<td>
						<a href="{{ action('PeriodoController@excluir', ['id' => $periodo->id]) }}" class="btn btn-danger excluir">Excluir</a>
						<a href="{{ action('PeriodoController@editar', ['curso_id' => $periodo->curso->id, 'id' => $periodo->id ]) }}" class="btn btn-warning">Editar</a>
						<a href="{{ action('DisciplinaController@listar', ['periodo_id' => $periodo->id]) }}" class="btn btn-link">Listar Disciplinas</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="3">Não há períodos para este curso.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('CursoController@listar') }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
			<a href="{{ action('PeriodoController@editar', ['curso_id' => $periodo->curso->id]) }}" class="btn btn-success">Adicionar Novo Período</a>
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