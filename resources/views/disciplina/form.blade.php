@extends('template')

@section('titulo', 'Edição de Disciplina')

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Edição de Disciplina do Período {{ $periodo->nome }} do Curso {{ $periodo->curso->nome }}
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('DisciplinaController@listar', ['periodo_id' => $periodo->id]) }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<form id="form" method="POST" action="{{ action('DisciplinaController@salvar') }}">
			{{ csrf_field() }}
			<input type="hidden" name="periodo_id" value="{{ $periodo->id }}">
			<input type="hidden" name="id" value="{{ $disciplina->id }}">
			<div class="form-group" style="margin-top: 10px">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" required="required" name="nome" id="nome" maxlength="200" placeholder="Informe o nome da disciplina" value="{{ $disciplina->nome }}">
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="ch_semanal">Carga Horária Semanal</label>
				<input type="number" class="form-control" required="required" name="ch_semanal" id="ch_semanal" placeholder="Informe o nome do período" value="{{ $disciplina->ch_semanal }}" aria-describedby="ch_semanal_help">
				<small id="ch_semanal_help" class="form-text text-muted">A carga horária semanal deve ser preencida com a quantidade de aulas semanais.</small>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</div>

@endsection