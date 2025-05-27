@extends('template')

@section('titulo', 'Disciplinas do Período '.$periodo->nome.' do Curso '.$periodo->curso->nome)

@section('conteudo')

<h4>Disciplinas do Período {{ $periodo->nome }} do Curso {{ $periodo->curso->nome }}</h4>
<div class="card">
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
					<th>Nome</th>
					<th>Carga Horária Semanal</th>
					<th width="400px"></th>
				</tr>
			</thead>
			<tbody>
				@forelse($periodo->disciplinas()->orderBy('nome')->get() as $disciplina)
				<tr>
					<td>{{ $disciplina->nome }}</td>
					<td>{{ $disciplina->ch_semanal }}</td>
					<td>
						<a href="{{ action('DisciplinaController@excluir', ['id' => $disciplina->id]) }}" class="btn btn-danger excluir">Excluir</a>
						<a href="{{ action('DisciplinaController@editar', ['periodo_id' => $disciplina->periodo->id, 'id' => $disciplina->id]) }}" class="btn btn-warning">Editar</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="3">Não há disciplinas para este período.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('PeriodoController@listar', ['curso_id' => $periodo->curso->id]) }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
			<a href="{{ action('DisciplinaController@editar', ['periodo_id' => $periodo->id]) }}" class="btn btn-success">Adicionar Nova Disciplina</a>
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