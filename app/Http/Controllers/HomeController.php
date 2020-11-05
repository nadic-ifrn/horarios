<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AnoLetivo;

class HomeController extends Controller
{
    
	public function main() {
		if (session()->has('usuario')) {
			$anos = AnoLetivo::orderBy('ano', 'desc')->orderBy('semestre', 'desc')->get();
			session()->put('sessao', 'inicio');
			return view('interno', compact('anos'));
		}
		return view('home');
	}

}
