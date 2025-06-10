<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SecretController extends Controller
{
    public function index()
    {
        $professores = DB::table('professors')->get();

        return view('secret.professores', compact('professores'));
    }

    public function toggleComissao($id)
    {
        $professor = DB::table('professors')->where('id', $id)->first();

        if ($professor) {
            DB::table('professors')
                ->where('id', $id)
                ->update(['comissao' => !$professor->comissao]);
        }

        return redirect()->back()->with('success', 'comissão atualizado');
    }
}
