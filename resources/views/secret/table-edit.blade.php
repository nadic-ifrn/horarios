@extends('template')

@section('titulo', 'Editar Registro - ' . $table)

@section('conteudo')

<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Editar Registro - {{ $table }} (ID: {{ $record->id }})</h4>
                <div class="pull-right">
                    <a href="{{ route('secret.table', $table) }}" class="btn btn-sm btn-secondary">
                        <i class="nc-icon nc-minimal-left"></i> Voltar
                    </a>
                </div>
            </div>
            <div class="card-body">
                <form action="{{ route('secret.update', [$table, $record->id]) }}" method="POST">
                    @csrf
                    @method('PUT')
                    
                    @foreach($editableColumns as $column)
                    <div class="form-group">
                        <label for="{{ $column }}">{{ ucfirst(str_replace('_', ' ', $column)) }}:</label>
                        @if(str_contains($column, 'id') && $column !== 'id')
                            <input type="number" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column, $record->$column) }}">
                        @elseif(in_array($column, ['comissao', 'concluido', 'seg', 'ter', 'qua', 'qui', 'sex', 'especial']))
                            <select class="form-control" id="{{ $column }}" name="{{ $column }}">
                                <option value="0" {{ old($column, $record->$column) == '0' ? 'selected' : '' }}>Não</option>
                                <option value="1" {{ old($column, $record->$column) == '1' ? 'selected' : '' }}>Sim</option>
                            </select>
                        @elseif($column === 'turno')
                            <select class="form-control" id="{{ $column }}" name="{{ $column }}">
                                <option value="M" {{ old($column, $record->$column) == 'M' ? 'selected' : '' }}>Manhã</option>
                                <option value="T" {{ old($column, $record->$column) == 'T' ? 'selected' : '' }}>Tarde</option>
                                <option value="N" {{ old($column, $record->$column) == 'N' ? 'selected' : '' }}>Noite</option>
                            </select>
                        @elseif(in_array($column, ['inicio', 'fim']))
                            <input type="date" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column, $record->$column) }}">
                        @elseif($column === 'observacao')
                            <textarea class="form-control" id="{{ $column }}" name="{{ $column }}" rows="3">{{ old($column, $record->$column) }}</textarea>
                        @else
                            <input type="text" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column, $record->$column) }}">
                        @endif
                        
                        @if($errors->has($column))
                            <div class="text-danger">{{ $errors->first($column) }}</div>
                        @endif
                    </div>
                    @endforeach

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">
                            <i class="nc-icon nc-check-2"></i> Atualizar
                        </button>
                        <a href="{{ route('secret.table', $table) }}" class="btn btn-secondary">
                            <i class="nc-icon nc-simple-remove"></i> Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
