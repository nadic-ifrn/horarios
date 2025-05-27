<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Professor extends Model
{
    
	protected $fillable = ['nome', 'matricula'];

	public function dias() {
		return $this->hasMany(Dia::class);
	}

}
