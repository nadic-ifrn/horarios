@extends('template')

@section('titulo', 'Submissões '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<h4>Submissões de Questionarios para o Período {{ $ano->ano }}.{{ $ano->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Professor</th>
					<th>Data e Hora de Envio</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				@forelse($ano->dias()->join('professors', 'professors.id', '=', 'dias.professor_id')->orderBy('professors.nome')->get(['dias.*']) as $dia)
				<tr>
					<td>{{ $dia->professor->nome }}</td>
					<td><span class="badge badge-success">OK</span> em {{ $dia->updated_at }}</td>
					<td width="150px">
						@if($dia->professor->id == session()->get('usuario')->id || session()->get('usuario')->comissao)
						<a href="{{ route('questionario.detalhar', ['id' => $dia->id]) }}" class="btn btn-link">Detalhar</a>
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
		<div class="text-right">
			<a href="/" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
		</div>
	</div>
</div>

@endsection