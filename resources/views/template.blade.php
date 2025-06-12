<!DOCTYPE html>
<html>

<head>
	<title>Horários IFRN/{{ Config::get('app.campus') }} - @yield('titulo')</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="/img/clock.png" />
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<!-- CSS Files -->
	<link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
	@yield('css')
	<style>
		.navbar.navbar-absolute.fixed-top {
			top: 10px;
		}
	</style>
</head>

<body>
	<div class="wrapper">
		@if (session()->has('usuario'))
		<div class="sidebar" data-color="white" data-active-color="danger">
			<div class="logo">
				<a href="/" class="simple-text logo-mini">
					<div class="logo-image-small">
						<img src="/img/clock.png">
					</div>
				</a>
				<a href="/" class="simple-text logo-normal">
					Horários {{ Config::get('app.campus') }}
				</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="{{ (session()->get('sessao') == 'inicio') ? 'active' : '' }}">
						<a href="/">
							<i class="nc-icon nc-shop"></i>
							<p>Início</p>
						</a>
					</li>
					@if (session()->get('usuario')->comissao)
					<li class="{{ (session()->get('sessao') == 'curso') ? 'active' : '' }}">
						<a href="{{ action('CursoController@listar') }}">
							<i class="nc-icon nc-book-bookmark"></i>
							<p>Cursos</p>
						</a>
					</li>
					<li class="{{ (session()->get('sessao') == 'anoletivo') ? 'active' : '' }}">
						<a href="{{ action('AnoLetivoController@listar') }}">
							<i class="nc-icon nc-calendar-60"></i>
							<p>Períodos Letivos</p>
						</a>
					</li>
					<li class="{{ (session()->get('sessao') == 'relatorios') ? 'active' : '' }}">
						<a href="{{ action('AnoLetivoController@relatorios') }}">
							<i class="nc-icon nc-single-copy-04"></i>
							<p>Relatórios</p>
						</a>
					</li>
					<li class="{{ (session()->get('sessao') == 'admin') ? 'active' : '' }}">
						<a href="{{ route('admin.db-editor') }}">
							<i class="nc-icon nc-settings-gear-65"></i>
							<p>Administração</p>
						</a>
					</li>
					@endif
					<li>
						<a href="{{ action('UsuarioController@sair') }}">
							<i class="nc-icon nc-button-power"></i>
							<p>Sair</p>
						</a>
					</li>
				</ul>
			</div>
		</div>
		@endif
		@if (session()->has('usuario'))
		<div class="main-panel" style="min-height: 100vh;">
			@else
			<div class="main-panel" style="height: 100vh; width: 100%;">
				@endif
				@if (session()->has('usuario'))
				<nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
					<div class="container-fluid">
						<div class="navbar-wrapper">
							<div class="navbar-toggle">
								<button type="button" class="navbar-toggler">
									<span class="navbar-toggler-bar bar1"></span>
									<span class="navbar-toggler-bar bar2"></span>
									<span class="navbar-toggler-bar bar3"></span>
								</button>
							</div>
						</div>
						<div class="justify-content-end">
							<ul class="nav navbar-nav navbar-right">
								<li>
									<i class="nc-icon nc-single-02"></i>
									<p>{{ session()->get('usuario')->nome }} ({{ session()->get('usuario')->matricula }})</p>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				@endif
				<div class="content">
					@yield('conteudo')
				</div>
				<footer class="footer footer-black footer-white">
					<div class="container-fluid">
						<div class="row">
							<div class="credits ml-auto">
								<span class="copyright">
									&copy; <script>
										document.write(new Date().getFullYear())
									</script>, template made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
								</span>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</div>
		<!--   Core JS Files   -->
		<script src="/assets/js/core/jquery.min.js"></script>
		<script src="/assets/js/core/popper.min.js"></script>
		<script src="/assets/js/core/bootstrap.min.js"></script>
		<script src="/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
		<!--  Notifications Plugin    -->
		<script src="/assets/js/plugins/bootstrap-notify.js"></script>
		<script src="/js/functions.js"></script>
		<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
		<script src="/assets/js/paper-dashboard.min.js?v=2.0.1"></script>
		@if (session()->has('flash'))
		<script>
			show_notification("{{ session()->get('flash')['tipo'] }}", "{{ session()->get('flash')['mensagem'] }}");
		</script>
		@endif
</body>
@yield('js')

</html>