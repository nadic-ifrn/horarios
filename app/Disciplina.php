<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Disciplina extends Model
{
    
	protected $fillable = ['nome', 'ch_semanal'];

	public function periodo() {
		return $this->belongsTo(Periodo::class);
	}

	public function cargas() {
		return $this->hasMany(Carga::class);
	}

}
