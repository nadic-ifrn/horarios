@extends('template')

@section('titulo', 'Questionário '.$ano->ano.'.'.$ano->semestre)

@section('conteudo')

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-12">
				Questionário {{ $ano->ano }}.{{ $ano->semestre }}
				@if ($dia != null)
				<span class="badge badge-success">Questionário já respondido em {{ $dia->updated_at }}</span>
				@endif
			</div>
		</div> 
	</div>
	<div class="card-body">
		<form id="questionario" enctype="multipart/form-data" method="POST" action="{{ action('QuestionarioController@submeter') }}">
			{{ csrf_field() }}
			<input type="hidden" name="id" value="{{ $ano->id }}">
			<ul class="list-unstyled">
				<li>Os dias pretendidos serão formados por dois grupos: Segunda à Quarta ou Quarta à Sexta;</li>
				<li>Confecção do horário tomará com base a <b>RESOLUÇÃO</b>, se houver, do campus referente a este tema;</li>
				<li>Professores com <b>Afastamento Parcial</b>, deverão apresentar a <b>portaria</b> (Regime Diferenciado);</li>
				<li><b class="badge badge-warning">Atenção</b> Se estiver respondendo novamente o questionário, as respostas anteriores serão substituídas pelas atuais.</li>
			</ul>
			<hr />
			<small class="required">* Campos obrigatórios.</small>
			<h5 style="padding-bottom: 10px; padding-top: 20px">1. Escolha dos dias da semana <sup class="required">*</sup></h5>
			<fieldset>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<input type="radio" name="q1" id="q1_seg_qua" aria-label="Radio button for following text input" value="1" required="required">
						</div>
					</div>
					<label for="q1_seg_qua" class="form-control" aria-label="Text input with radio button">Segunda-feira / Terça-feira / Quarta-feira</label>
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<input type="radio" name="q1" id="q1_qua_sex" aria-label="Radio button for following text input" value="2" required="required">
						</div>
					</div>
					<label for="q1_qua_sex" class="form-control" aria-label="Text input with radio button">Quarta-feira / Quinta-feira / Sexta-feira</label>
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<input type="radio" name="q1" id="q1_reg_diferenciado" aria-label="Radio button for following text input" value="3" required="required">
						</div>
					</div>
					<label for="q1_reg_diferenciado" class="form-control" aria-label="Text input with radio button">Regime Diferenciado</label>
				</div>
			</fieldset>
			<div id="q1_regime_diferenciado" style="display: none">
				<h5 style="padding-bottom: 10px; padding-top: 20px">1.1. Escolha dos dias da semana <sup class="required">*</sup></h5>
				<fieldset>
					<div class="row">
						<div class="col-6">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<input type="checkbox" name="q1_1[]" id="q1_1_seg" aria-label="Radio button for following text input" value="seg">
									</div>
								</div>
								<label for="q1_1_seg" class="form-control" aria-label="Text input with radio button">Segunda-feira</label>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<input type="checkbox" name="q1_1[]" id="q1_2_ter" aria-label="Radio button for following text input" value="ter">
									</div>
								</div>
								<label for="q1_2_ter" class="form-control" aria-label="Text input with radio button">Terça-feira</label>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<input type="checkbox" name="q1_1[]" id="q1_3_qua" aria-label="Radio button for following text input" value="qua">
									</div>
								</div>
								<label for="q1_3_qua" class="form-control" aria-label="Text input with radio button">Quarta-feira</label>
							</div>
						</div>
						<div class="col-6">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<input type="checkbox" name="q1_1[]" id="q1_4_qui" aria-label="Radio button for following text input" value="qui">
									</div>
								</div>
								<label for="q1_4_qui" class="form-control" aria-label="Text input with radio button">Quinta-feira</label>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<input type="checkbox" name="q1_1[]" id="q1_5_sex" aria-label="Radio button for following text input" value="sex">
									</div>
								</div>
								<label for="q1_5_sex" class="form-control" aria-label="Text input with radio button">Sexta-feira</label>
							</div>
						</div>
					</div>
				</fieldset>
				<h5 style="padding-bottom: 10px; padding-top: 20px">1.2. Autorização da DIAC (portaria de afastamento parcial ou outros, em formato PDF) <sup class="required">*</sup></h5>
				<div class="custom-file">
					<input type="file" accept=".pdf" class="custom-file-input" name="q1_2" id="q1_2" lang="pt-BR">
					<label class="custom-file-label" for="q1_2">Escolha o arquivo</label>
				</div>
				<div class="form-group" style="margin-top: 10px">
					<label for="q1_2_c">Descrição do arquivo de autorização</label>
					<input type="text" class="form-control" name="q1_2_comentario" maxlength="200" id="q1_2_c">
				</div>
			</div>
			<h5 style="padding-bottom: 10px; padding-top: 20px">2. Seleção das disciplinas <sup class="required">*</sup></h5>
			<div class="row">
				<div class="col-6">
					<div class="form-group">
						<label for="q2_turma">Pesquisar por turma</label>
						<select class="form-control" id="q2_turma">
							<option value=""></option>
							@foreach($ano->turmas()->join('periodos', 'periodos.id', '=', 'turmas.periodo_id')->join('cursos', 'cursos.id', '=', 'periodos.curso_id')->orderBy('cursos.nome')->get(['turmas.*']) as $turma)
							<option value="{{ $turma->id }}">{{ $turma->periodo->curso->nome }} ({{ $turma->periodo->curso->sigla }}.{{ substr($turma->periodo->nome, 0, 1) }}{{ $turma->turno }})</option>
							@endforeach
						</select>
					</div>
				</div>
				<div class="col-6">
					<div class="form-group">
						<label for="q2_disciplina">Escolha da disciplina</label>
						<select class="form-control" id="q2_disciplina">
							<option value=""></option>
							<optgroup></optgroup>
						</select>
					</div>
				</div>
			</div>
			<div class="text-right">
				<button type="button" id="q2_add" class="btn btn-success">
					<span class="nc-icon nc-simple-add"></span> Adicionar
				</button>
			</div>
			<ul class="list-group" id="q2_lista" style="margin-top: 20px; margin-bottom: 20px"></ul>
			<small id="q2-error" class="text-danger" style="display: none">Adicione ao menos uma disciplina</small>
			<h5 style="padding-bottom: 10px; padding-top: 20px">3. Observações</h5>
			<div class="form-group">
				<textarea class="form-control" name="q3" id="q3"></textarea>
			</div>
			<div class="text-right">
				<a href="/" class="btn btn-link">
					<span class="nc-icon nc-minimal-left"></span> Voltar
				</a>
				<button type="submit" class="btn btn-primary">
					<span class="nc-icon nc-send"></span> Enviar
				</button>
			</div>
		</form>
	</div>
</div>

@endsection

@section('css')

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" rel="stylesheet" />
<link href="/css/select2-bootstrap.min.css" rel="stylesheet" />

@endsection

@section('js')

<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
<script src="/js/questionario.js"></script>

@endsection