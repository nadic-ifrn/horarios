<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Anexo extends Model
{
    
	protected $fillable = ['local', 'comentario'];

	public function dia() {
		return $this->belongsTo(Dia::class);
	}

}
