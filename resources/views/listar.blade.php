@extends('template')

@section('titulo', 'Submissões '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6">
				Submissões de Questionarios para o Período {{ $ano->ano }}.{{ $ano->semestre }}
			</div>
			<div class="col-6 text-right">
				<a href="/" class="card-link">Voltar</a>
			</div>
		</div> 
	</div>
	<div class="card-body">
		<table class="table table-hover">
			<tbody>
				@forelse($ano->dias()->join('professors', 'professors.id', '=', 'dias.professor_id')->orderBy('professors.nome')->get() as $dia)
				<tr>
					<td>{{ $dia->professor->nome }}</td>
					<td><span class="badge badge-success">OK</span> em {{ $dia->updated_at }}</td>
					<td>
						@if($dia->professor->id == session()->get('usuario')->id)
						<a href="{{ action('QuestionarioController@detalhar', ['id' => $dia->id]) }}" class="btn btn-success">Detalhar</a>
						@endif
					</td>
				</tr>
				@empty
				<tr>
					<td>Não há submissões para este período.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
	</div>
</div>

@endsection