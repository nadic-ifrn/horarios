@extends('template')

@section('titulo', 'Tabela: ' . $table)

@section('conteudo')

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Tabela: {{ $table }}</h4>
                <div class="pull-right">
                    <a href="{{ route('admin.db-editor') }}" class="btn btn-sm btn-secondary">
                        <i class="nc-icon nc-minimal-left"></i> Voltar
                    </a>
                    <a href="{{ route('admin.create', $table) }}" class="btn btn-sm btn-success">
                        <i class="nc-icon nc-simple-add"></i> Novo Registro
                    </a>
                </div>
            </div>
            <div class="card-body">
                @if($data->count() > 0)
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                @foreach($columns as $column)
                                <th>{{ $column }}</th>
                                @endforeach
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($data as $record)
                            <tr>
                                @foreach($columns as $column)
                                <td>
                                    @if(is_bool($record->$column))
                                    {{ $record->$column ? 'Sim' : 'Não' }}
                                    @else
                                    {{ $record->$column }}
                                    @endif
                                </td>
                                @endforeach
                                <td>
                                    <a href="{{ route('admin.edit', [$table, $record->id]) }}" class="btn btn-sm btn-warning">
                                        <i class="nc-icon nc-ruler-pencil"></i> Editar
                                    </a>
                                    <form action="{{ route('admin.destroy', [$table, $record->id]) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('Tem certeza que deseja excluir este registro?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="nc-icon nc-simple-remove"></i> Excluir
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Paginação -->
                <div class="row">
                    <div class="col-md-12">
                        {{ $data->links() }}
                    </div>
                </div>
                @else <div class="alert alert-info">
                    <strong>Nenhum registro encontrado nesta tabela.</strong>
                    <br>
                    <a href="{{ route('admin.create', $table) }}" class="btn btn-sm btn-success mt-2">
                        <i class="nc-icon nc-simple-add"></i> Criar primeiro registro
                    </a>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection