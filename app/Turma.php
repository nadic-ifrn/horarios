<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Turma extends Model
{

	protected $fillable = ['turno', 'observacao'];
    
	public function ano_letivo() {
		return $this->belongsTo(AnoLetivo::class);
	}

	public function periodo() {
		return $this->belongsTo(Periodo::class);
	}

	public function cargas() {
		return $this->hasMany(Carga::class);
	}

}
