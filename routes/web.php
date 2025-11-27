<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\QuestionarioController;
use App\Http\Controllers\AnexoController;
use App\Http\Controllers\DisciplinaController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\PeriodoController;
use App\Http\Controllers\AnoLetivoController;
use App\Http\Controllers\TurmaController;
use App\Http\Controllers\AdminController;

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

Route::get('/', [HomeController::class, 'main']);

Route::group(['middleware' => 'visitante'], function() {
	Route::post('/autenticar', [UsuarioController::class, 'autenticar']);
});

Route::group(['middleware' => 'usuario:comum'], function() {
	Route::get('/logout', [UsuarioController::class, 'sair']);
	
	Route::get('/questionario/responder/{id}', [QuestionarioController::class, 'responder']);
	Route::post('/questionario/submeter', [QuestionarioController::class, 'submeter']);
	Route::get('/questionario/listar/{idAnoLetivo}', [QuestionarioController::class, 'listar']);
	Route::get('/questionario/detalhar/{id}', [QuestionarioController::class, 'detalhar']);
	Route::get('/questionario/anexo/{id}', [AnexoController::class, 'visualizar']);

	Route::get('/disciplinas/listar/turma/{turma_id}', [DisciplinaController::class, 'listar_json']);

	Route::group(['middleware' => 'usuario:comissao'], function() {
		Route::get('/curso/listar', [CursoController::class, 'listar']);
		Route::get('/curso/excluir/{id}', [CursoController::class, 'excluir']);
		Route::get('/curso/editar/{id?}', [CursoController::class, 'editar']);
		Route::post('/curso/salvar', [CursoController::class, 'salvar']);

		Route::get('/periodo/listar/{curso_id}', [PeriodoController::class, 'listar']);
		Route::get('/periodo/excluir/{id}', [PeriodoController::class, 'excluir']);
		Route::get('/periodo/editar/{curso_id}/{id?}', [PeriodoController::class, 'editar']);
		Route::post('/periodo/salvar', [PeriodoController::class, 'salvar']);

		Route::get('/disciplina/listar/{periodo_id}', [DisciplinaController::class, 'listar']);
		Route::get('/disciplina/excluir/{id}', [DisciplinaController::class, 'excluir']);
		Route::get('/disciplina/editar/{periodo_id}/{id?}', [DisciplinaController::class, 'editar']);
		Route::post('/disciplina/salvar', [DisciplinaController::class, 'salvar']);

		Route::get('/ano_letivo/listar', [AnoLetivoController::class, 'listar']);
		Route::get('/ano_letivo/excluir/{id}', [AnoLetivoController::class, 'excluir']);
		Route::get('/ano_letivo/editar/{id?}', [AnoLetivoController::class, 'editar']);
		Route::post('/ano_letivo/salvar', [AnoLetivoController::class, 'salvar']);

		Route::get('/turma/listar/{ano_letivo_id}', [TurmaController::class, 'listar']);
		Route::get('/turma/excluir/{id}', [TurmaController::class, 'excluir']);
		Route::get('/turma/editar/{ano_letivo_id}/{id?}', [TurmaController::class, 'editar']);
		Route::post('/turma/salvar', [TurmaController::class, 'salvar']);

		Route::get('/ano_letivo/relatorios', [AnoLetivoController::class, 'relatorios']);
		Route::get('/ano_letivo/relatorio_respostas/{id}', [AnoLetivoController::class, 'relatorio_respostas']);
		Route::get('/ano_letivo/relatorio_exportar/{id}', [AnoLetivoController::class, 'relatorio_exportar']);
	});
});

Route::group(['middleware' => 'usuario:comissao'], function () {	// Gerenciamento de usuários
	Route::get('/admin/usuarios', [AdminController::class, 'usuarios'])->name('admin.usuarios');
	Route::patch('/admin/usuarios/toggle/{id}', [AdminController::class, 'toggleComissao'])->name('admin.toggle-comissao');
	Route::delete('/admin/usuarios/{id}', [AdminController::class, 'destroyUser'])->name('admin.destroy-user');

	// Editor do banco de dados
	Route::get('/admin/db-editor', [AdminController::class, 'dbEditor'])->name('admin.db-editor');
	Route::get('/admin/db-editor/{table}', [AdminController::class, 'showTable'])->name('admin.table');
	Route::get('/admin/db-editor/{table}/create', [AdminController::class, 'createRecord'])->name('admin.create');
	Route::post('/admin/db-editor/{table}', [AdminController::class, 'storeRecord'])->name('admin.store');
	Route::get('/admin/db-editor/{table}/{id}/edit', [AdminController::class, 'editRecord'])->name('admin.edit');
	Route::put('/admin/db-editor/{table}/{id}', [AdminController::class, 'updateRecord'])->name('admin.update');
	Route::delete('/admin/db-editor/{table}/{id}', [AdminController::class, 'destroyRecord'])->name('admin.destroy');
	Route::get('/admin/sql-executor', [AdminController::class, 'sqlExecutor'])->name('admin.sql-executor');
	Route::post('/admin/sql-executor', [AdminController::class, 'executeSql'])->name('admin.sql-execute');
	Route::get('/admin/sql-export-all', [AdminController::class, 'exportAllTables'])->name('admin.sql-export-all');
});