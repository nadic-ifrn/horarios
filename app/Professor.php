<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Professor extends Model
{
	protected $table = 'professors';

	protected $fillable = ['nome', 'matricula', 'comissao'];

	public function dias() {
		return $this->hasMany(Dia::class);
	}

}
