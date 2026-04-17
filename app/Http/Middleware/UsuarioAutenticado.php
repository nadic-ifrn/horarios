<?php

namespace App\Http\Middleware;

use Closure;
use App\Professor;

class UsuarioAutenticado
{
    public function handle($request, Closure $next, $regra)
    {
        if ( session()->has('usuario') ) {
            $usuarioSessao = session()->get('usuario');
            $usuarioAtualizado = Professor::find($usuarioSessao->id);

            if ($usuarioAtualizado) {
                session()->put('usuario', $usuarioAtualizado);
            }

            if ( $regra == 'comissao' && session()->get('usuario')->comissao ) {
                return $next($request);
            } else if ( $regra == 'comum' ) {
                return $next($request);
            }
        }
        return redirect('/');
    }
}
