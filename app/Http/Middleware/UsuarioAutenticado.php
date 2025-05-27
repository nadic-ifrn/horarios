<?php

namespace App\Http\Middleware;

use Closure;

class UsuarioAutenticado
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $regra)
    {
        if ( session()->has('usuario') ) {
            if ( $regra == 'comissao' && session()->get('usuario')->comissao ) {
                return $next($request);
            } else if ( $regra == 'comum' ) {
                return $next($request);
            }
        }
        return redirect('/');
    }
}
