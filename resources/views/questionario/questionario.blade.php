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
			</ul>

			<div style="margin: 15px 0; padding: 15px; background-color: #fff3cd; border-left: 3px solid #ffc107; border-radius: 5px;">
				<h6 style="color: #856404; margin-bottom: 10px;"><b><i class="nc-icon nc-alert-circle-i" style="margin-right: 5px;"></i>Atenção</b></h6>
				<p style="color: #856404; margin-bottom: 0;">Se estiver respondendo novamente o questionário, as respostas anteriores serão substituídas pelas atuais.</p>
			</div>

			<div style="margin-top: 15px; margin-bottom: 15px;">
				<h6><b>Informações Importantes:</b></h6>
				<ul class="list-unstyled" style="margin-left: 15px;">
					<li>• Cada grupo ou Curso deve organizar a distribuição de disciplinas de forma que fique equilibrada a opção de dias da semana. Sendo assim, o horário poderá ser confeccionado sem choques e necessidade de trocas de dias e/ou turmas.</li>
					<li style="margin-top: 10px;">• Caso haja necessidade você pode informar neste formulário restrições de dias e horários disponíveis para suas atividades em sala de aula.</li>
				</ul>
			</div>

			<div style="margin-bottom: 15px;">
				<h6><b>Tipos de Restrições:</b></h6>
				<ul class="list-unstyled" style="margin-left: 15px;">
					<li><b>I -</b> Por necessidade comprovada: tratamento ou acompanhamento de dependentes em tratamento de saúde, Coordenação de curso, ação de desenvolvimento em serviço, entre outros. Isso mediante envio de documento comprobatório. Exceto no caso de Coordenação de Curso.</li>
					<li style="margin-top: 8px;"><b>II -</b> Em função de ter trabalhado em horários críticos no semestre anterior - desde que tenha ocorrido por no mínimo 75% do período.</li>
				</ul>
			</div>

			<details style="margin-bottom: 15px;">
				<summary style="cursor: pointer; color: #007bff; font-weight: bold; padding: 8px 0;">Definição de Horários Críticos</summary>
				<div style="margin-top: 10px; padding: 15px; background-color: #f8f9fa; border-left: 3px solid #007bff;">
					<p style="margin-bottom: 15px;"><b>Entende-se por horário crítico</b> aquele no qual o deslocamento do(a) servidor(a) de casa ao trabalho (e vice-versa) é induzido a ocorrer muito cedo da manhã ou muito tarde da noite.</p>

					<h6><b>São considerados horários críticos:</b></h6>
					<ul style="margin-bottom: 15px;">
						<li><b>I.</b> Os dois primeiros horários da segunda-feira pela manhã (para quem fica de segunda à quarta).</li>
						<li><b>II.</b> Os dois últimos horários da quarta-feira à tarde e os quatro da noite (para quem fica de segunda à quarta).</li>
						<li><b>III.</b> Os dois primeiros horários da quarta-feira pela manhã (para quem fica de quarta à sexta).</li>
						<li><b>IV.</b> Os dois últimos horários da sexta-feira à tarde e os quatro da noite (para quem fica de quarta à sexta).</li>
					</ul>

					<h6><b>Rodízio de Horários Críticos:</b></h6>
					<p style="margin-bottom: 10px;">Os horários definidos como críticos serão preenchidos obedecendo um rodízio, de modo a evitar que um(a) mesmo(a) professor(a) tenha aulas nesses horários em semestres seguidos, <b>exceto quando:</b></p>
					<ul>
						<li><b>I -</b> Não requerido pelo(a) docente no formulário;</li>
						<li><b>II -</b> No semestre anterior o(a) docente trabalhou em horários críticos em um percentual menor que 75% do semestre letivo;</li>
						<li><b>III -</b> Quando não for possível organizar o horário levando isso em consideração.</li>
					</ul>
				</div>
			</details>

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
			<h5 style="padding-bottom: 10px; padding-top: 20px">4. Restrição no horário</h5>
			<p style="margin-bottom: 15px;">Para o caso de restrições de determinados dias da semana e horários por necessidade comprovada, envie aqui o comprovante.</p>
			<div style="margin-bottom: 15px; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
				<h6 style="color: #0056b3; margin-bottom: 10px;"><b>Observação:</b></h6>
				<p style="margin-bottom: 0; color: #0056b3;">Caso tenha necessidade de enviar mais de um documento é necessário que este seja compilado em um único PDF.</p>
			</div>
			<div class="custom-file">
				<input type="file" accept=".pdf" class="custom-file-input" name="q4" id="q4" lang="pt-BR">
				<label class="custom-file-label" for="q4">Escolha o arquivo</label>
			</div>
			<div class="form-group" style="margin-top: 10px">
				<label for="q4_comentario">Descrição do arquivo de autorização</label>
				<input type="text" class="form-control" name="q4_comentario" maxlength="200" id="q4_comentario">
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