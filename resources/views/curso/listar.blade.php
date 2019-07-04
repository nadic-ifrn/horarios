@extends('template')

@section('titulo', 'Cursos')

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Cursos da Instituição
			</div>
			<div class="col-6 text-right">
				<a href="/" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<ul class="list-unstyled">
			<li>Os cursos dão origem às turmas que devem ser criadas nos períodos letivos, tornando possível a organização dos horários;</li>
			<li><b class="badge badge-warning">Atenção</b> Somente é possível a exclusão de cursos que não  possuam períodos registrados;</li>
		</ul>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Curso</th>
					<th>Sigla</th>
					<th width="350px"></th>
				</tr>
			</thead>
			<tbody>
				@forelse($cursos as $curso)
				<tr>
					<td>{{ $curso->nome }}</td>
					<td>{{ $curso->sigla }}</td>
					<td>
						<a href="{{ action('CursoController@excluir', ['id' => $curso->id]) }}" class="btn btn-danger excluir">Excluir</a>
						<a href="{{ action('CursoController@editar', ['id' => $curso->id]) }}" class="btn btn-warning">Editar</a>
						<a href="{{ action('PeriodoController@listar', ['curso_id' => $curso->id]) }}" class="btn btn-link">Listar Períodos</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="3">Não há cursos nesta instituição.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('CursoController@editar') }}" class="btn btn-success">Adicionar Novo Curso</a>
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