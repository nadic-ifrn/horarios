@extends('template')

@section('titulo', 'Gestão de Usuários')

@section('conteudo')

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Gestão de Usuários</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <a href="{{ route('admin.db-editor') }}" class="btn btn-info">
                            <i class="nc-icon nc-minimal-left"></i> Voltar ao Editor
                        </a>
                    </div>
                </div>

                <h5>Professores Cadastrados:</h5>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Matrícula</th>
                                <th>Status Administrativo</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($professores as $professor)
                            <tr>
                                <td><strong>{{ $professor->id }}</strong></td>
                                <td>{{ $professor->nome }}</td>
                                <td>{{ $professor->matricula }}</td>
                                <td>
                                    @if($professor->comissao)
                                    <span class="badge badge-success">
                                        <i class="nc-icon nc-check-2"></i> Administrador
                                    </span>
                                    @else
                                    <span class="badge badge-secondary">
                                        <i class="nc-icon nc-single-02"></i> Professor
                                    </span>
                                    @endif
                                </td>
                                <td>
                                    <form action="{{ route('admin.toggle-comissao', $professor->id) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('Tem certeza que deseja alterar o status administrativo de {{ $professor->nome }}?')">
                                        @csrf
                                        @method('PATCH')
                                        @if($professor->comissao)
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="nc-icon nc-simple-remove"></i> Remover Admin
                                        </button>
                                        @else
                                        <button type="submit" class="btn btn-sm btn-success">
                                            <i class="nc-icon nc-simple-add"></i> Tornar Admin
                                        </button>
                                        @endif
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                @if($professores->count() == 0)
                <div class="alert alert-info">
                    <strong>Nenhum professor encontrado.</strong>
                    <br>
                    Os professores são cadastrados automaticamente quando fazem login no sistema pela primeira vez.
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection