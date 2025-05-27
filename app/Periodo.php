<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Periodo extends Model
{
    
	protected $fillable = ['ordem', 'nome'];

	public function curso() {
		return $this->belongsTo(Curso::class);
	}

	public function turmas() {
		return $this->hasMany(Turma::class);
	}

	public function disciplinas() {
		return $this->hasMany(Disciplina::class);
	}

}
