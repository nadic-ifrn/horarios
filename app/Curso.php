<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    protected $fillable = ['nome', 'sigla'];

    public function periodos() {
    	return $this->hasMany(Periodo::class);
    }
}
