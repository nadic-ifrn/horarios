@extends('template')

@section('titulo', 'Edição de Período')

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Edição de Período do Curso {{ $curso->nome }}
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('PeriodoController@listar', ['curso_id' => $curso->id]) }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
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
				<button class="btn btn-primary" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</div>

@endsection