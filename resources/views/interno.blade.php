@extends('template')

@section('titulo', 'Home')

@section('conteudo')

<h4>Início</h4>
<div class="card">
	<div class="card-body">
		@forelse($anos as $ano)
		<div class="card-plain">
			<div class="card-body">
				<h5 class="card-title">
					@if(!$ano->concluido)
					<span class="badge badge-pill badge-success">!</span>
					@endif
					Período {{ $ano->ano }}.{{ $ano->semestre }}
				</h5>
				<p class="card-text">{{ (!$ano->concluido) ? 'O período encontra-se aberto para submissão do questionário.' : 'O período encontra-se fechado.' }}</p>
				@if(!$ano->concluido)
				<a href="{{ action('QuestionarioController@responder', ['id' => $ano->id]) }}" class="card-link">Preencher Questionário</a>
				@endif
				<a href="{{ action('QuestionarioController@listar', ['id' => $ano->id]) }}" class="card-link">Visualizar</a>
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