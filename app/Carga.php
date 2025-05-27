<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Carga extends Model
{

	protected $fillable = ['observacao'];

    public function turma() {
		return $this->belongsTo(Turma::class);
	}

	public function disciplina() {
		return $this->belongsTo(Disciplina::class);
	}

	public function dia() {
		return $this->belongsTo(Dia::class);
	}

}
