@extends('template')

@section('titulo', 'Edição de Curso')

@section('conteudo')

<h4>Edição de Curso</h4>
<div class="card">
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
				<a href="{{ action('CursoController@listar') }}" class="btn btn-link">
					<span class="nc-icon nc-minimal-left"></span> Voltar
				</a>
				<button class="btn btn-primary" type="submit">
					<span class="nc-icon nc-check-2"></span> Salvar
				</button>
			</div>
		</form>
	</div>
</div>

@endsection