@extends('template')

@section('titulo', 'Professores')

@section('conteudo')

<div class="row mb-3">
    <div class="col-md-6">
        <h3>Professores</h3>
    </div>
    <div class="col-md-6 text-right">
        <a href="{{ route('secret.db-editor') }}" class="btn btn-info">
            <i class="nc-icon nc-settings"></i> Editor de Banco
        </a>
        <a href="{{ route('secret.sql-executor') }}" class="btn btn-warning">
            <i class="nc-icon nc-caps-small"></i> Executor SQL
        </a>
    </div>
</div>

<table class="table">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Matrícula</th>
        <th>Comissão</th>
        <th>Ação</th>
    </tr>
    @foreach($professores as $professor)
    <tr>
        <td>{{ $professor->id }}</td>
        <td>{{ $professor->nome }}</td>
        <td>{{ $professor->matricula }}</td>
        <td>{{ $professor->comissao ? 'Sim' : 'Não' }}</td>
        <td>
            <form action="{{ route('secret.toggle-comissao', $professor->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <button type="submit" class="btn btn-sm">
                    {{ $professor->comissao ? 'Remover' : 'Adicionar' }}
                </button>
            </form>
        </td>
    </tr>
    @endforeach
</table>

@endsection