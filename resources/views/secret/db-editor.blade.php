@extends('template')

@section('titulo', 'Editor de db')

@section('conteudo')

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Editor de db</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <a href="{{ route('secret.sql-executor') }}" class="btn btn-info">
                            <i class="nc-icon nc-settings"></i> Executor SQL
                        </a>
                    </div>
                </div>

                <h5>Tabelas Disponíveis:</h5>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Tabela</th>
                                <th>Registros</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($tables as $table)
                            <tr>
                                <td><strong>{{ $table['name'] }}</strong></td>
                                <td>{{ $table['count'] }} registros</td>
                                <td>
                                    <a href="{{ route('secret.table', $table['name']) }}" class="btn btn-sm btn-primary">
                                        <i class="nc-icon nc-zoom-split"></i> Ver
                                    </a>
                                    <a href="{{ route('secret.create', $table['name']) }}" class="btn btn-sm btn-success">
                                        <i class="nc-icon nc-simple-add"></i> Novo
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection