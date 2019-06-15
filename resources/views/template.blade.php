<!DOCTYPE html>
<html>
	<head>
		<title>Horários IFRN/CN - @yield('titulo')</title>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/css/app.css">
		@yield('css')
	</head>
	<body>
		<div class="container-fluid">
			<!-- As a link -->
			<nav class="navbar navbar-light bg-light">
				<a class="navbar-brand" href="/">Horários CN</a>
				@if (session()->has('usuario'))
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">{{ session()->get('usuario')->nome }} ({{ session()->get('usuario')->matricula }})</a>
					</li>
        		</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="{{ action('UsuarioController@sair') }}">Sair</a>
					</li>
				</ul>
				@endif
			</nav>
			<div class="container" style="margin-top: 20px; margin-bottom: 20px">
				@if (session()->has('flash'))
				<div class="alert alert-{{ session()->get('flash')['tipo'] }} alert-dismissible fade show" role="alert">
					{{ session()->get('flash')['mensagem'] }}
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    					<span aria-hidden="true">&times;</span>
  					</button>
				</div>
				@endif
				@yield('conteudo')
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
		<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script> -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		@yield('js')
	</body>
</html>