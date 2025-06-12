<?php

use Illuminate\Support\Facades\Route;

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
		Route::get('/ano_letivo/relatorio_exportar/{id}', 'AnoLetivoController@relatorio_exportar');		//Route::get('/ano_letivo/relatorio_timetables/{id}', 'AnoLetivoController@relatorio_timetables');
	});
});

Route::group(['middleware' => 'usuario:comissao'], function () {
	// Gerenciamento de usuários
	Route::get('/admin/usuarios', 'AdminController@usuarios')->name('admin.usuarios');
	Route::patch('/admin/usuarios/toggle/{id}', 'AdminController@toggleComissao')->name('admin.toggle-comissao');

	// Editor do banco de dados
	Route::get('/admin/db-editor', 'AdminController@dbEditor')->name('admin.db-editor');
	Route::get('/admin/db-editor/{table}', 'AdminController@showTable')->name('admin.table');
	Route::get('/admin/db-editor/{table}/create', 'AdminController@createRecord')->name('admin.create');
	Route::post('/admin/db-editor/{table}', 'AdminController@storeRecord')->name('admin.store');
	Route::get('/admin/db-editor/{table}/{id}/edit', 'AdminController@editRecord')->name('admin.edit');
	Route::put('/admin/db-editor/{table}/{id}', 'AdminController@updateRecord')->name('admin.update');
	Route::delete('/admin/db-editor/{table}/{id}', 'AdminController@destroyRecord')->name('admin.destroy');
	Route::get('/admin/sql-executor', 'AdminController@sqlExecutor')->name('admin.sql-executor');
	Route::post('/admin/sql-executor', 'AdminController@executeSql')->name('admin.sql-execute');
	Route::get('/admin/sql-export-all', 'AdminController@exportAllTables')->name('admin.sql-export-all');
});