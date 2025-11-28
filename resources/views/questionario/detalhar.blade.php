@extends('template')

@section('titulo', 'Detalhes Questionário '.$dia->ano_letivo->ano.'.'.$dia->ano_letivo->semestre)

@section('conteudo')

<h4>Detalhes de Questionário {{ $dia->ano_letivo->ano }}.{{ $dia->ano_letivo->semestre }}</h4>
<div class="card">
	<div class="card-body">
		<ul class="list-unstyled">
			<li>Questionario do(a) professor(a) <b>{{ $dia->professor->nome }}</b>.</li>
			<li><small class="text-muted">Submetido em {{ $dia->updated_at }}</small></li>
		</ul>
		<h5 style="padding-bottom: 10px; padding-top: 20px">1. Escolha dos dias da semana</h5>
		@if($dia->especial)
		<div style="margin: 15px 0; padding: 15px; background-color: #fff3cd; border-left: 3px solid #ffc107; border-radius: 5px;">
			<h6 style="color: #856404; margin-bottom: 10px;"><b>Regime Diferenciado</b></h6>
			<p style="color: #856404; margin-bottom: 0;">Professor optou por dias específicos da semana.</p>
		</div>
		@else
		<div style="margin: 15px 0; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
			<h6 style="color: #0056b3; margin-bottom: 10px;"><b>Regime Padrão</b></h6>
			<p style="color: #0056b3; margin-bottom: 0;">
				@if($dia->seg && $dia->ter && $dia->qua && !$dia->qui && !$dia->sex)
				Segunda-feira / Terça-feira / Quarta-feira
				@elseif(!$dia->seg && !$dia->ter && $dia->qua && $dia->qui && $dia->sex)
				Quarta-feira / Quinta-feira / Sexta-feira
				@else
				Dias personalizados selecionados
				@endif
			</p>
		</div>
		@endif
		<table class="table">
			<thead>
				<tr>
					<th>SEG</th>
					<th>TER</th>
					<th>QUA</th>
					<th>QUI</th>
					<th>SEX</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						@if($dia->seg)
						<span class="badge badge-success">OK</span>
						@endif
					</td>
					<td>
						@if($dia->ter)
						<span class="badge badge-success">OK</span>
						@endif
					</td>
					<td>
						@if($dia->qua)
						<span class="badge badge-success">OK</span>
						@endif
					</td>
					<td>
						@if($dia->qui)
						<span class="badge badge-success">OK</span>
						@endif
					</td>
					<td>
						@if($dia->sex)
						<span class="badge badge-success">OK</span>
						@endif
					</td>
				</tr>
			</tbody>
		</table>
		<!-- @if($dia->especial)
		<h5 style="padding-bottom: 10px; padding-top: 20px">1.1. Dias específicos selecionados</h5>
		<div style="margin: 15px 0; padding: 15px; background-color: #f8f9fa; border-left: 3px solid #6c757d; border-radius: 5px;">
			<h6 style="color: #495057; margin-bottom: 10px;"><b>Dias selecionados:</b></h6>
			<ul style="margin-bottom: 0; color: #495057;">
				@if($dia->seg)<li>Segunda-feira</li>@endif
				@if($dia->ter)<li>Terça-feira</li>@endif
				@if($dia->qua)<li>Quarta-feira</li>@endif
				@if($dia->qui)<li>Quinta-feira</li>@endif
				@if($dia->sex)<li>Sexta-feira</li>@endif
			</ul>
		</div>
		@endif -->

		<h5 style="padding-bottom: 10px; padding-top: 20px">2. Seleção das disciplinas</h5>
		<table class="table">
			<thead>
				<tr>
					<th>Turma</th>
					<th>Disciplina</th>
					<th>CH Semanal</th>
				</tr>
			</thead>
			<tbody>
				@foreach($dia->cargas as $carga)
				<tr>
					<td>{{ $carga->turma->periodo->curso->sigla }}.{{ substr($carga->turma->periodo->nome, 0, 1) }}{{ $carga->turma->turno }}</td>
					<td>{{ $carga->disciplina->nome }}</td>
					<td>{{ $carga->disciplina->ch_semanal }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		<h5 style="padding-bottom: 10px; padding-top: 20px">3. Observações</h5>
		<p>
			@if($dia->observacao)
			{{ $dia->observacao }}
			@else
			Não há.
			@endif
		</p>
		<h5 style="padding-bottom: 10px; padding-top: 20px">4. Restrição no horário</h5>
		@if($dia->anexo)
		<div style="margin: 15px 0; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
			<h6 style="color: #0056b3; margin-bottom: 10px;"><b>Arquivo de Autorização</b></h6>
			<p style="color: #0056b3; margin-bottom: 10px;">{{ $dia->anexo->comentario ?: 'Arquivo de autorização enviado' }}</p>
			<a href="{{ route('anexo.visualizar', ['id' => $dia->anexo->id]) }}" target="_blank" class="btn btn-sm btn-outline-success">Visualizar Documento</a>
		</div>
		@else
		<p>Não há.</p>
		@endif <div class="text-right">
			<a href="javascript:window.history.back()" class="btn btn-link">
				<span class="nc-icon nc-minimal-left"></span> Voltar
			</a>
		</div>
	</div>
</div>

@endsection