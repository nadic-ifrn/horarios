@extends('template')

@section('titulo', 'Professores')

@section('conteudo')

<h3>Professores</h3>

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