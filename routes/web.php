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

Route::group(['middleware' => 'usuario'], function() {
	Route::get('/logout', 'UsuarioController@sair');
	
	Route::get('/questionario/responder/{id}', 'QuestionarioController@responder');
	Route::post('/questionario/submeter', 'QuestionarioController@submeter');
	Route::get('/questionario/listar/{idAnoLetivo}', 'QuestionarioController@listar');
	Route::get('/questionario/detalhar/{id}', 'QuestionarioController@detalhar');
	Route::get('/questionario/anexo/{id}', 'AnexoController@visualizar');


	Route::get('/disciplinas/listar/turma/{idTurma}', 'DisciplinaController@listar');
});