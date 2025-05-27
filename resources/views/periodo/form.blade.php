@extends('template')

@section('titulo', 'Edição de Período')

@section('conteudo')

<h4>Edição de Período do Curso {{ $curso->nome }}</h4>
<div class="card">
	<div class="card-body">
		<form id="form" method="POST" action="{{ action('PeriodoController@salvar') }}">
			{{ csrf_field() }}
			<input type="hidden" name="curso_id" value="{{ $curso->id }}">
			<input type="hidden" name="id" value="{{ $periodo->id }}">
			<div class="form-group" style="margin-top: 10px">
				<label for="ordem">Ordem</label>
				<input type="number" class="form-control" required="required" name="ordem" id="ordem" placeholder="Informe a ordem cronológica do período no curso" value="{{ $periodo->ordem }}">
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" required="required" name="nome" id="nome" maxlength="20" placeholder="Informe o nome do período" value="{{ $periodo->nome }}" aria-describedby="nome_help">
				<small id="nome_help" class="form-text text-muted">Nomes de períodos devem seguir o padrão descrito na tela de listagem de períodos.</small>
			</div>
			<div class="text-right">
				<a href="{{ action('PeriodoController@listar', ['curso_id' => $curso->id]) }}" class="btn btn-link">
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