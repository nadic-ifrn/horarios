<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Anexo;

class AnexoController extends Controller
{
    
	public function visualizar($id) {
		$anexo = Anexo::find($id);
		if ($anexo != null && ($anexo->dia->professor->id == session()->get('usuario')->id || 
				session()->get('usuario')->comissao))
			return response()->file(storage_path('app').'/'.$anexo->local);
		return redirect('/');
	}

}
