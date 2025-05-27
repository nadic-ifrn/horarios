@extends('template')

@section('titulo', 'Relatórios')

@section('conteudo')

<h4>Relatórios e Exportação</h4>
<div class="card">
	<div class="card-body">
		<ul class="list-unstyled">
			<li><b class="badge badge-warning">Atenção</b> A exportação funciona apenas para o software Asc Timetables. Ao clicar em <b>Exportar dados para o TimeTables</b> um arquivo XML será baixado. Para importá-lo basta, no TimeTables, selecionar <b>Arquivo -> Importar -> aSc TimeTables XML</b>.</li>
		</ul>
		@forelse($anos as $ano)
		<div class="card-plain">
			<div class="card-body">
				<h5 class="card-title">
					@if(!$ano->concluido)
					<span class="badge badge-pill badge-success">!</span>
					@endif
					Período {{ $ano->ano }}.{{ $ano->semestre }}
				</h5>
				<p class="card-text">{{ (!$ano->concluido) ? 'O período ainda encontra-se aberto para submissão do questionário.' : 'O período encontra-se fechado.' }}</p>
				<a href="{{ action('AnoLetivoController@relatorio_respostas', ['id' => $ano->id]) }}" class="card-link">Respostas ao questionário para o período</a>
				<a href="{{ action('AnoLetivoController@relatorio_exportar', ['id' => $ano->id]) }}" class="card-link">Exportar dados para o TimeTables</a>
			</div>
		</div>
		<hr />
		@empty
		<div class="card-plain">
			<div class="card-body">
				<p class="card-text">Não há períodos letivos criados.</p>
			</div>
		</div>
		@endforelse
	</div>
</div>

@endsection