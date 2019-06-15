@extends('template')

@section('titulo', 'Home')

@section('conteudo')

<div class="card">
	<div class="card-header">Login</div>
	<div class="card-body">
		<form action="{{ action('UsuarioController@autenticar') }}" method="POST">
			{{ csrf_field() }}
			<div class="form-group">
				<label for="matricula">Matrícula</label>
				<input required="required" type="text" class="form-control" name="matricula" id="matricula" aria-describedby="matriculaHelp" placeholder="Matrícula SIAPE">
				<small id="matriculaHelp" class="form-text text-muted">Informe sua matrícula SIAPE.</small>
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<input required="required" type="password" class="form-control" name="senha" id="senha" aria-describedby="senhaHelp" placeholder="Senha SUAP">
				<small id="senhaHelp" class="form-text text-muted">A senha deve ser a mesma utilizada no SUAP.</small>
			</div>
			<div class="text-right">
				<button type="submit" class="btn btn-primary">Entrar</button>
			</div>
		</form>
	</div>
</div>

@endsection