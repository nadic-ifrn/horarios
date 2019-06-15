<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Dia extends Model
{
    
	protected $fillable = ['seg', 'ter', 'qua', 'qui', 'sex', 'especial', 'observacao'];

	public function getUpdatedAtAttribute($date) {
		return Carbon::parse($date)->format('d/m/Y à\s H:i:s');
	}

	public function ano_letivo() {
		return $this->belongsTo(AnoLetivo::class);
	}

	public function professor() {
		return $this->belongsTo(Professor::class);
	}

	public function anexo() {
		return $this->hasOne(Anexo::class);
	}

	public function cargas() {
		return $this->hasMany(Carga::class);
	}

}
