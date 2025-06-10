@extends('template')

@section('titulo', 'Criar Registro - ' . $table)

@section('conteudo')

<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Criar Novo Registro - {{ $table }}</h4>
                <div class="pull-right">
                    <a href="{{ route('secret.table', $table) }}" class="btn btn-sm btn-secondary">
                        <i class="nc-icon nc-minimal-left"></i> Voltar
                    </a>
                </div>
            </div>
            <div class="card-body">
                <form action="{{ route('secret.store', $table) }}" method="POST">
                    @csrf
                    
                    @foreach($columns as $column)
                    <div class="form-group">
                        <label for="{{ $column }}">{{ ucfirst(str_replace('_', ' ', $column)) }}:</label>
                        @if(str_contains($column, 'id') && $column !== 'id')
                            <input type="number" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column) }}">
                        @elseif(in_array($column, ['comissao', 'concluido', 'seg', 'ter', 'qua', 'qui', 'sex', 'especial']))
                            <select class="form-control" id="{{ $column }}" name="{{ $column }}">
                                <option value="0" {{ old($column) == '0' ? 'selected' : '' }}>Não</option>
                                <option value="1" {{ old($column) == '1' ? 'selected' : '' }}>Sim</option>
                            </select>
                        @elseif($column === 'turno')
                            <select class="form-control" id="{{ $column }}" name="{{ $column }}">
                                <option value="M" {{ old($column) == 'M' ? 'selected' : '' }}>Manhã</option>
                                <option value="T" {{ old($column) == 'T' ? 'selected' : '' }}>Tarde</option>
                                <option value="N" {{ old($column) == 'N' ? 'selected' : '' }}>Noite</option>
                            </select>
                        @elseif(in_array($column, ['inicio', 'fim']))
                            <input type="date" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column) }}">
                        @elseif($column === 'observacao')
                            <textarea class="form-control" id="{{ $column }}" name="{{ $column }}" rows="3">{{ old($column) }}</textarea>
                        @else
                            <input type="text" class="form-control" id="{{ $column }}" name="{{ $column }}" value="{{ old($column) }}">
                        @endif
                        
                        @if($errors->has($column))
                            <div class="text-danger">{{ $errors->first($column) }}</div>
                        @endif
                    </div>
                    @endforeach

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">
                            <i class="nc-icon nc-check-2"></i> Salvar
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
