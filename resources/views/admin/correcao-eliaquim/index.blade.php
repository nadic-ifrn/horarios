@extends('template')

@section('titulo', 'Correção Eliaquim 2026.2')

@section('conteudo')
<div class="container mt-4">
    <h3>Correção de Dados — Eliaquim 2026.2</h3>

    @if(isset($error))
        <div class="alert alert-danger">
            <strong>Erro:</strong> {{ $error }}<br>
            <small>{{ $executed }} de {{ $total }} statements executados antes do erro.</small>
        </div>
    @elseif(isset($executed))
        <div class="alert alert-success">
            <strong>Correção aplicada!</strong> {{ $executed }} statements executados com sucesso.
        </div>
        <table class="table table-sm table-bordered mt-3" style="max-width:300px">
            @foreach(['disciplinas'=>'Disciplinas','dias'=>'Dias','cargas'=>'Cargas'] as $tabela => $label)
            <tr>
                <td>{{ $label }}</td>
                <td><strong>{{ DB::table($tabela)->count() }}</strong></td>
            </tr>
            @endforeach
        </table>
    @else
        <div class="alert alert-warning">
            <strong>O que esta correção faz (sem apagar dados de outros professores):</strong>
            <ol class="mt-2">
                <li>Adiciona <strong>Biologia - Vida e Diversidade</strong> ao API 2º Período (se ausente)</li>
                <li>Cria o Dia de Eliaquim em 2026.2 (se ainda não respondeu o questionário)</li>
                <li>Apaga apenas as cargas existentes do Eliaquim</li>
                <li>Insere as cargas corretas:</li>
            </ol>
            <ul>
                <li>Sociologia I — INF 1º Vespertino</li>
                <li>Sociologia III — INF 3º Vespertino</li>
                <li>Sociologia III — ALI 3º Vespertino</li>
                <li>Sociologia do Trabalho — API 4º Vespertino</li>
                <li>Sociologia do Trabalho — AGRO 4º Noturno</li>
                <li>Introdução à Extensão — AGRO 2º Vespertino</li>
                <li>Ciência, Tecnologia e Sociedade — ESP Módulo 2 Noturno</li>
            </ul>
        </div>
        <form method="POST" action="{{ route('correcao-eliaquim.executar') }}">
            @csrf
            <button type="submit" class="btn btn-warning"
                onclick="return confirm('Confirma a correção? As cargas atuais do Eliaquim serão substituídas.')">
                Aplicar Correção
            </button>
            <a href="/admin" class="btn btn-secondary ml-2">Cancelar</a>
        </form>
    @endif
</div>
@endsection
