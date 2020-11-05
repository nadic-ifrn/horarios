@extends('template')

@section('titulo', 'Turmas do Período Letivo '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<h4>Turmas do Período Letivo {{ $ano->ano }}.{{ $ano->semestre }}</h4>
<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-6 text-right">
				
			</div>
		</div> 
	</div>
	<div class="card-body">
		<ul class="list-unstyled">
			<li><b class="badge badge-warning">Atenção</b> Somente é possível a exclusão de turmas que não foram utilizadas como respostas de questionários por professores;</li>
		</ul>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Turma</th>
					<th>Observação</th>
					<th width="350px"></th>
				</tr>
			</thead>
			<tbody>
				@forelse($ano->turmas()->join('periodos', 'turmas.periodo_id', '=', 'periodos.id')->join('cursos', 'periodos.curso_id', '=', 'cursos.id')->orderBy('cursos.nome')->orderBy('periodos.ordem')->orderBy('periodos.nome')->get(['turmas.*']) as $turma)
				<tr>
					<td>{{ $turma->periodo->curso->nome }} ({{ $turma->periodo->curso->sigla }}.{{ substr($turma->periodo->nome, 0, 1) }}{{ $turma->turno }})</td>
					<td>{{ $turma->observacao }}</td>
					<td>
						<a href="{{ action('TurmaController@excluir', ['id' => $turma->id]) }}" class="btn btn-danger excluir">Excluir</a>
						<a href="{{ action('TurmaController@editar', ['ano_letivo_id' => $turma->ano_letivo->id, 'id' => $turma->id ]) }}" class="btn btn-warning">Editar</a>
					</td>
				</tr>
				@empty
				<tr>
					<td colspan="3">Não há turmas para este período letivo.</td>
				</tr>
				@endforelse
			</tbody>
		</table>
		<div class="text-right">
			<a href="{{ action('AnoLetivoController@listar') }}" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
			<a href="{{ action('TurmaController@editar', ['ano_letivo_id' => $ano->id]) }}" class="btn btn-success">Adicionar Nova Turma</a>
		</div>
	</div>
</div>

@endsection

@section('js')

<script>
	$(function(){
		$('.excluir').on('click', function(e) {
			if (!confirm('Deseja realmente excluir?')) {
				e.preventDefault();
			}
		});
	});
</script>

@endsection