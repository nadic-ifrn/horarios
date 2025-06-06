<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@main');

Route::group(['middleware' => 'visitante'], function() {
	Route::post('/autenticar', 'UsuarioController@autenticar');	
});

Route::group(['middleware' => 'usuario:comum'], function() {
	Route::get('/logout', 'UsuarioController@sair');
	
	Route::get('/questionario/responder/{id}', 'QuestionarioController@responder');
	Route::post('/questionario/submeter', 'QuestionarioController@submeter');
	Route::get('/questionario/listar/{idAnoLetivo}', 'QuestionarioController@listar');
	Route::get('/questionario/detalhar/{id}', 'QuestionarioController@detalhar');
	Route::get('/questionario/anexo/{id}', 'AnexoController@visualizar');

	Route::get('/disciplinas/listar/turma/{turma_id}', 'DisciplinaController@listar_json');

	Route::group(['middleware' => 'usuario:comissao'], function() {
		Route::get('/curso/listar', 'CursoController@listar');
		Route::get('/curso/excluir/{id}', 'CursoController@excluir');
		Route::get('/curso/editar/{id?}', 'CursoController@editar');
		Route::post('/curso/salvar', 'CursoController@salvar');

		Route::get('/periodo/listar/{curso_id}', 'PeriodoController@listar');
		Route::get('/periodo/excluir/{id}', 'PeriodoController@excluir');
		Route::get('/periodo/editar/{curso_id}/{id?}', 'PeriodoController@editar');
		Route::post('/periodo/salvar', 'PeriodoController@salvar');

		Route::get('/disciplina/listar/{periodo_id}', 'DisciplinaController@listar');
		Route::get('/disciplina/excluir/{id}', 'DisciplinaController@excluir');
		Route::get('/disciplina/editar/{periodo_id}/{id?}', 'DisciplinaController@editar');
		Route::post('/disciplina/salvar', 'DisciplinaController@salvar');

		Route::get('/ano_letivo/listar', 'AnoLetivoController@listar');
		Route::get('/ano_letivo/excluir/{id}', 'AnoLetivoController@excluir');
		Route::get('/ano_letivo/editar/{id?}', 'AnoLetivoController@editar');
		Route::post('/ano_letivo/salvar', 'AnoLetivoController@salvar');

		Route::get('/turma/listar/{ano_letivo_id}', 'TurmaController@listar');
		Route::get('/turma/excluir/{id}', 'TurmaController@excluir');
		Route::get('/turma/editar/{ano_letivo_id}/{id?}', 'TurmaController@editar');
		Route::post('/turma/salvar', 'TurmaController@salvar');

		Route::get('/ano_letivo/relatorios', 'AnoLetivoController@relatorios');
		Route::get('/ano_letivo/relatorio_respostas/{id}', 'AnoLetivoController@relatorio_respostas');
		Route::get('/ano_letivo/relatorio_exportar/{id}', 'AnoLetivoController@relatorio_exportar');
		//Route::get('/ano_letivo/relatorio_timetables/{id}', 'AnoLetivoController@relatorio_timetables');
	});
});