@extends('template')

@section('titulo', 'Importar Horários 2026.2')

@section('conteudo')
<div class="container mt-4">
    <h3>Importar Horários 2026.2</h3>

    @if(isset($error))
        <div class="alert alert-danger">
            <strong>Erro:</strong> {{ $error }}<br>
            <small>{{ $executed }} de {{ $total }} statements executados antes do erro.</small>
        </div>
    @elseif(isset($executed))
        <div class="alert alert-success">
            <strong>Importação concluída!</strong> {{ $executed }} statements executados com sucesso.
        </div>
        <table class="table table-sm table-bordered mt-3" style="max-width:300px">
            @foreach([
                'cursos'=>'Cursos','periodos'=>'Períodos','disciplinas'=>'Disciplinas',
                'ano_letivos'=>'Anos Letivos','turmas'=>'Turmas',
                'professors'=>'Professores','dias'=>'Dias','cargas'=>'Cargas'
            ] as $tabela => $label)
            <tr>
                <td>{{ $label }}</td>
                <td><strong>{{ DB::table($tabela)->count() }}</strong></td>
            </tr>
            @endforeach
        </table>
    @else
        <div class="alert alert-warning">
            <strong>Atenção:</strong> Esta operação apaga todos os dados existentes e importa os horários 2026.2.<br>
            Professores, cursos, períodos, disciplinas, turmas, dias e cargas serão recriados.
        </div>
        <form method="POST" action="{{ route('importar-2026-2.executar') }}">
            @csrf
            <button type="submit" class="btn btn-danger"
                onclick="return confirm('Confirma a importação? Todos os dados serão apagados.')">
                Executar Importação
            </button>
            <a href="/admin" class="btn btn-secondary ml-2">Cancelar</a>
        </form>
    @endif
</div>
@endsection
