@extends('template')

@section('titulo', 'Edição de Turma')

@section('conteudo')

<h4>Edição de Turma do Período Letivo {{ $ano->ano }}.{{ $ano->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<form id="form" method="POST" action="{{ action('TurmaController@salvar') }}">
			{{ csrf_field() }}
			<input type="hidden" name="ano_letivo_id" value="{{ $ano->id }}">
			<input type="hidden" name="id" value="{{ $turma->id }}">
			<div class="form-group" style="margin-top: 10px">
				<label for="periodo_id">Curso e Período</label>
				<select class="form-control" required="required" name="periodo_id" id="periodo_id">
					@foreach ($periodos as $periodo)
					<option value="{{ $periodo->id }}" {{ ($turma->periodo_id == $periodo->id) ? 'selected="selected"' : '' }}>{{ $periodo->curso->nome }} - {{ $periodo->nome }}º</option>
					@endforeach
				</select>
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="turno">Turno</label>
				<select class="form-control" required="required" name="turno" id="turno">
					<option value="M" {{ ($turma->turno == 'M' || empty($ano->concluido)) ? 'selected="selected"' : '' }}>Manhã</option>
					<option value="T" {{ ($turma->turno == 'T') ? 'selected="selected"' : '' }}>Tarde</option>
					<option value="N" {{ ($turma->turno == 'N') ? 'selected="selected"' : '' }}>Noite</option>
				</select>
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="observacao">Observação</label>
				<input type="text" class="form-control" name="observacao" id="observacao" maxlength="200" value="{{ $turma->observacao }}">
			</div>
			<div class="text-right">
				<a href="{{ action('TurmaController@listar', ['ano_letivo_id' => $ano->id]) }}" class="btn btn-link">
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