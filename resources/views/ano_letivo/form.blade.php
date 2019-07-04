@extends('template')

@section('titulo', 'Edição de Período Letivo')

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Edição de Período Letivo
			</div>
			<div class="col-6 text-right">
				<a href="{{ action('AnoLetivoController@listar') }}" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<form id="form" method="POST" action="{{ action('AnoLetivoController@salvar') }}">
			{{ csrf_field() }}
			<input type="hidden" name="id" value="{{ $ano->id }}">
			<div class="form-group" style="margin-top: 10px">
				<label for="ano">Ano</label>
				<input type="number" class="form-control" required="required" name="ano" id="ano" placeholder="Informe o ano do período letivo" value="{{ $ano->ano }}">
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="semestre">Semestre</label>
				<input type="number" class="form-control" required="required" name="semestre" id="semestre" placeholder="Informe o semestre do período letivo" value="{{ $ano->semestre }}">
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="concluido">Período fechado para respostas</label>
				<select class="form-control" required="required" name="concluido" id="concluido" aria-describedby="concluido_help">
					<option value="0" {{ (!$ano->concluido || empty($ano->concluido)) ? 'selected="selected"' : '' }}>Não</option>
					<option value="1" {{ ($ano->concluido) ? 'selected="selected"' : '' }}>Sim</option>
				</select>
				<small id="concluido_help" class="form-text text-muted">Caso deseje fechar o questionário para novas submissões deve-se selecionar a opção Sim, do contrário Não é a opção mais coerente.</small>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</div>

@endsection