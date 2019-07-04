@extends('template')

@section('titulo', 'Relatórios')

@section('conteudo')

<div class="card">
	<div class="card-header">Relatórios e Exportação</div>
	<div class="card-body">
		@foreach($anos as $ano)
		<div class="card" style="margin-bottom: 20px">
			<div class="card-body">
				<h5 class="card-title">
					@if(!$ano->concluido)
					<span class="badge badge-pill badge-success">!</span>
					@endif
					Período {{ $ano->ano }}.{{ $ano->semestre }}
				</h5>
				<p class="card-text">{{ (!$ano->concluido) ? 'O período ainda encontra-se aberto para submissão do questionário.' : 'O período encontra-se fechado.' }}</p>
				<a href="{{ action('AnoLetivoController@relatorio_respostas', ['id' => $ano->id]) }}" class="card-link">Respostas ao questionário para o período</a><br />
				<a href="{{ action('AnoLetivoController@relatorio_timetables', ['id' => $ano->id]) }}" class="card-link">Exportar dados para o TimeTables</a>
			</div>
		</div>
		@endforeach
	</div>
</div>

@endsection