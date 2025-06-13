$(document).ready(function () {
    bsCustomFileInput.init();
    $("input[name=q1]").on("change", function () {
        if ($(this).val() == 3) {
            $("#q1_regime_diferenciado").slideDown();
            $("#q1_2").attr("required", "required");
        } else {
            $("#q1_regime_diferenciado").slideUp();
            $("#q1_2").removeAttr("required");
        }
    });
    $("#q2_turma")
        .select2({ placeholder: "Selecione uma turma", theme: "bootstrap" })
        .on("change", function () {
            var turmaId = $(this).val();
            var $disciplinaSelect = $("#q2_disciplina");
            var $addButton = $("#q2_add");

            // Limpar disciplinas
            $disciplinaSelect
                .empty()
                .append('<option value="">Carregando disciplinas...</option>');
            $disciplinaSelect.prop("disabled", true);
            $addButton.prop("disabled", true);

            if (turmaId !== "") {
                $.get("/disciplinas/listar/turma/" + turmaId, function (data) {
                    var options =
                        '<option value="">Selecione uma disciplina...</option>';
                    for (var i in data) {
                        options +=
                            "<option value='" +
                            data[i].id +
                            "'>" +
                            data[i].nome +
                            " (" +
                            data[i].ch_semanal +
                            " ch/semanal)</option>";
                    }
                    $disciplinaSelect.html(options);
                    $disciplinaSelect.prop("disabled", false);
                    $disciplinaSelect.select2({
                        placeholder: "Selecione uma disciplina",
                        theme: "bootstrap",
                    });
                }).fail(function () {
                    $disciplinaSelect.html(
                        '<option value="">Erro ao carregar disciplinas</option>'
                    );
                    $disciplinaSelect.prop("disabled", true);
                });
            } else {
                $disciplinaSelect.html(
                    '<option value="">Primeiro selecione uma turma</option>'
                );
                $disciplinaSelect.prop("disabled", true);
            }
        });

    $("#q2_disciplina")
        .select2({
            placeholder: "Primeiro selecione uma turma",
            theme: "bootstrap",
        })
        .on("change", function () {
            var $addButton = $("#q2_add");
            if ($(this).val() !== "" && $("#q2_turma").val() !== "") {
                $addButton.prop("disabled", false);
            } else {
                $addButton.prop("disabled", true);
            }
        });
    $("#q2_add").on("click", function () {
        var turmaId = $("#q2_turma").val();
        var disciplinaId = $("#q2_disciplina").val();

        if (turmaId === "" || disciplinaId === "") {
            if (turmaId === "") {
                alert("Por favor, selecione primeiro uma turma.");
            } else {
                alert("Por favor, selecione uma disciplina.");
            }
            return;
        }

        // Verificar se a disciplina já foi adicionada
        var jaAdicionada = false;
        $(".q2_d").each(function () {
            if ($(this).val() == disciplinaId) {
                jaAdicionada = true;
                return false;
            }
        });

        if (jaAdicionada) {
            alert("Esta disciplina já foi adicionada à lista.");
            return;
        }

        var li = $("<li>")
            .attr(
                "class",
                "list-group-item d-flex justify-content-between align-items-center"
            )
            .html(
                $("#q2_disciplina option:selected").html() +
                    " - " +
                    $("#q2_turma option:selected").html()
            )
            .append(
                $("<a>")
                    .attr({
                        class: "rm-disciplina badge-lg badge-danger badge-pill",
                        href: "#q2_lista",
                        style: "cursor: pointer;",
                    })
                    .html("Remover")
            )
            .append(
                $("<input>")
                    .attr({ class: "q2_t", type: "hidden", name: "q2_t[]" })
                    .val(turmaId)
            )
            .append(
                $("<input>")
                    .attr({ class: "q2_d", type: "hidden", name: "q2_d[]" })
                    .val(disciplinaId)
            );
        $("#q2_lista").append(li);

        // Limpar seleções após adicionar
        $("#q2_disciplina").val("").trigger("change");
        $("#q2_turma").val("").trigger("change");

        test();
    });
    $("#q2_lista").on("click", ".rm-disciplina", function (e) {
        e.preventDefault();
        if (confirm("Deseja remover esta disciplina da lista?")) {
            $(this).parent().remove();
            test();
        }
    });
    $("#questionario")
        .on("submit", function (e) {
            if ($(".q2_d").length < 1) {
                test();
                e.preventDefault();
            }
        })
        .validate({
            rules: {
                q1: { required: true },
                "q1_1[]": { required: true },
                q1_2: { required: true },
                q1_2_comentario: { required: true },
            },
            messages: {
                q1: "Selecione uma das opções de dias.",
                "q1_1[]": "Selecione ao menos um dia.",
                q1_2: "A autorização é obrigatória para o regime diferenciado.",
                q1_2_comentario: "Preencha a descrição da autorização.",
            },
            errorElement: "div",
            errorPlacement: function (error, element) {
                error.addClass("invalid-feedback");

                if (
                    element.prop("type") === "checkbox" ||
                    element.prop("type") === "radio"
                ) {
                    error.insertAfter(element.parents("fieldset"));
                } else {
                    error.insertAfter(element);
                }
            },
        });
});

function test() {
    if ($(".q2_d").length < 1) {
        $("#q2-error").css("display", "block");
    } else {
        $("#q2-error").css("display", "none");
    }
}
