<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Turma;

class DisciplinaController extends Controller
{
    
	public function listar($idTurma) {
		$disciplinas = [];
		$turma = Turma::find($idTurma);
		if ($turma != null) {
			$disciplinas = $turma->periodo->disciplinas;
		}
		return response()->json($disciplinas);
	}

}
