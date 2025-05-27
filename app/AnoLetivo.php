<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AnoLetivo extends Model
{
    
	protected $fillable = ['ano', 'semestre', 'concluido'];

	public function turmas() {
		return $this->hasMany(Turma::class);
	}

	public function dias() {
		return $this->hasMany(Dia::class);
	}

}
