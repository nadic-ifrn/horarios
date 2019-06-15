@extends('template')

@section('titulo', 'Home')

@section('conteudo')

<div class="card">
	<div class="card-header">Horários de CN</div>
	<div class="card-body">
		@foreach($anos as $ano)
		<div class="card">
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
		@endforeach
	</div>
</div>

@endsection