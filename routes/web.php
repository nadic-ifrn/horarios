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

Route::get('/', [HomeController::class, 'main'])->name('home');

Route::group(['middleware' => 'visitante'], function() {
	Route::post('/autenticar', [UsuarioController::class, 'autenticar'])->name('autenticar');
	Route::get('/autenticar', function() {
		return redirect()->route('home');
	});
});

Route::group(['middleware' => 'usuario:comum'], function() {
	Route::get('/logout', [UsuarioController::class, 'sair'])->name('logout');
	
	Route::get('/questionario/responder/{id}', [QuestionarioController::class, 'responder'])->name('questionario.responder');
	Route::post('/questionario/submeter', [QuestionarioController::class, 'submeter'])->name('questionario.submeter');
	Route::get('/questionario/listar/{idAnoLetivo}', [QuestionarioController::class, 'listar'])->name('questionario.listar');
	Route::get('/questionario/detalhar/{id}', [QuestionarioController::class, 'detalhar'])->name('questionario.detalhar');
	Route::get('/questionario/anexo/{id}', [AnexoController::class, 'visualizar'])->name('anexo.visualizar');

	Route::get('/disciplinas/listar/turma/{turma_id}', [DisciplinaController::class, 'listar_json'])->name('disciplina.listar_json');

	Route::group(['middleware' => 'usuario:comissao'], function() {
		Route::get('/curso/listar', [CursoController::class, 'listar'])->name('curso.listar');
		Route::get('/curso/excluir/{id}', [CursoController::class, 'excluir'])->name('curso.excluir');
		Route::get('/curso/editar/{id?}', [CursoController::class, 'editar'])->name('curso.editar');
		Route::post('/curso/salvar', [CursoController::class, 'salvar'])->name('curso.salvar');

		Route::get('/periodo/listar/{curso_id}', [PeriodoController::class, 'listar'])->name('periodo.listar');
		Route::get('/periodo/excluir/{id}', [PeriodoController::class, 'excluir'])->name('periodo.excluir');
		Route::get('/periodo/editar/{curso_id}/{id?}', [PeriodoController::class, 'editar'])->name('periodo.editar');
		Route::post('/periodo/salvar', [PeriodoController::class, 'salvar'])->name('periodo.salvar');

		Route::get('/disciplina/listar/{periodo_id}', [DisciplinaController::class, 'listar'])->name('disciplina.listar');
		Route::get('/disciplina/excluir/{id}', [DisciplinaController::class, 'excluir'])->name('disciplina.excluir');
		Route::get('/disciplina/editar/{periodo_id}/{id?}', [DisciplinaController::class, 'editar'])->name('disciplina.editar');
		Route::post('/disciplina/salvar', [DisciplinaController::class, 'salvar'])->name('disciplina.salvar');

		Route::get('/ano_letivo/listar', [AnoLetivoController::class, 'listar'])->name('ano_letivo.listar');
		Route::get('/ano_letivo/excluir/{id}', [AnoLetivoController::class, 'excluir'])->name('ano_letivo.excluir');
		Route::get('/ano_letivo/editar/{id?}', [AnoLetivoController::class, 'editar'])->name('ano_letivo.editar');
		Route::post('/ano_letivo/salvar', [AnoLetivoController::class, 'salvar'])->name('ano_letivo.salvar');

		Route::get('/turma/listar/{ano_letivo_id}', [TurmaController::class, 'listar'])->name('turma.listar');
		Route::get('/turma/excluir/{id}', [TurmaController::class, 'excluir'])->name('turma.excluir');
		Route::get('/turma/editar/{ano_letivo_id}/{id?}', [TurmaController::class, 'editar'])->name('turma.editar');
		Route::post('/turma/salvar', [TurmaController::class, 'salvar'])->name('turma.salvar');

		Route::get('/ano_letivo/relatorios', [AnoLetivoController::class, 'relatorios'])->name('ano_letivo.relatorios');
		Route::get('/ano_letivo/relatorio_respostas/{id}', [AnoLetivoController::class, 'relatorio_respostas'])->name('ano_letivo.relatorio_respostas');
		Route::get('/ano_letivo/relatorio_exportar/{id}', [AnoLetivoController::class, 'relatorio_exportar'])->name('ano_letivo.relatorio_exportar');
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