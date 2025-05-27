$(document).ready(function () {
	bsCustomFileInput.init();
	$('input[name=q1]').on('change', function(){
		if ($(this).val() == 3) {
			$('#q1_regime_diferenciado').slideDown();
			$('#q1_2').attr('required', 'required');
		} else {
			$('#q1_regime_diferenciado').slideUp();
			$('#q1_2').removeAttr('required');
		}
	});
	$('#q2_turma').select2({ placeholder : 'Selecione uma turma', theme : "bootstrap" }).on('change', function() {
		if ($(this).val() !== "") {
			$.get('/disciplinas/listar/turma/' + $(this).val(), function(data) {
				options = "";
				for (var i in data) {
					options += "<option value='" + data[i].id + "'>"+ data[i].nome +" ("+ data[i].ch_semanal +" ch/semanal)</option>";
				}
				$('#q2_disciplina optgroup').html(options);
				$('#q2_disciplina').select2({ placeholder : 'Escolha a disciplina', theme : "bootstrap" });
			});
		}
	});
	$('#q2_disciplina').select2({ placeholder : 'Selecione primeiro a turma', theme : "bootstrap" });
	$('#q2_add').on('click', function() {
		if ($('#q2_turma').val() !== "" && $('#q2_disciplina').val() !== "") {
			var li = $('<li>').attr('class', 'list-group-item d-flex justify-content-between align-items-center')
				.html($('#q2_disciplina option:selected').html() + " - " + $('#q2_turma option:selected').html()).append(
					$('<a>').attr({'class' : 'rm-disciplina badge-lg badge-danger badge-pill', 'href' : '#q2_lista'}).html('Remover')
				).append(
					$('<input>').attr({'class' : 'q2_t', 'type' : 'hidden', 'name' : 'q2_t[]'}).val($('#q2_turma').val())
				).append(
					$('<input>').attr({'class' : 'q2_d', 'type' : 'hidden', 'name' : 'q2_d[]'}).val($('#q2_disciplina').val())
				);
			$('#q2_lista').append(li);
			test();
		} else {
			alert("Selecione uma turma e uma disciplina primeiro.");
		}
	});
	$('#q2_lista').on('click', '.rm-disciplina', function() {
		if (confirm('Deseja remover esta disciplina?')) {
			$(this).parent().remove();
			test();
		}
	});
	$('#questionario').on('submit', function(e) {
		if ( $('.q2_d').length < 1 ) {
			test();
			e.preventDefault();
		}
	}).validate({
		rules : {
			q1 : { required : true },
			"q1_1[]" : { required : true },
			q1_2 : { required : true },
			q1_2_comentario : { required : true }
		},
		messages : {
			q1 : "Selecione uma das opções de dias.",
			"q1_1[]" : "Selecione ao menos um dia.",
			q1_2 : "A autorização é obrigatória para o regime diferenciado.",
			q1_2_comentario : "Preencha a descrição da autorização."
		},
		errorElement : "div",
		errorPlacement : function ( error, element ) {
			error.addClass( "invalid-feedback" );

			if ( element.prop( "type" ) === "checkbox" || element.prop( "type" ) === "radio" ) {
				error.insertAfter( element.parents( "fieldset" ) );
			} else {
				error.insertAfter( element );
			}
		}
	});
});

function test() {
	if ( $('.q2_d').length < 1 ) {
		$('#q2-error').css('display', 'block');
	} else {
		$('#q2-error').css('display', 'none');
	}
}