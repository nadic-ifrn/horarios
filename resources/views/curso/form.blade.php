@extends('template')

@section('titulo', 'Edição de Curso')

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Edição de Curso
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('CursoController@listar') }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<form id="form" method="POST" action="{{ action('CursoController@salvar') }}">
			{{ csrf_field() }}
			<input type="hidden" name="id" value="{{ $curso->id }}">
			<div class="form-group" style="margin-top: 10px">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" required="required" name="nome" id="nome" maxlength="200" placeholder="Informe o nome do curso" value="{{ $curso->nome }}">
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="sigla">Sigla</label>
				<input type="text" class="form-control" required="required" name="sigla" id="sigla" maxlength="20" placeholder="Informe a sigla do curso" value="{{ $curso->sigla }}" aria-describedby="sigla_help">
				<small id="sigla_help" class="form-text text-muted">Tente usar um padrão de siglas para os cursos.</small>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</div>

@endsection