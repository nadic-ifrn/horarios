@extends('template')

@section('titulo', 'Executor SQL')

@section('conteudo')

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Executor SQL</h4>
                <div class="pull-right">
                    <a href="{{ route('admin.db-editor') }}" class="btn btn-sm btn-secondary">
                        <i class="nc-icon nc-minimal-left"></i> Voltar ao Editor
                    </a>
                </div>
            </div>
            <div class="card-body">
                <small class="text-muted">⚠️ Consultas SQL executadas diretamente no banco de dados</small> @if(isset($exported) && $exported)
                <div class="alert alert-success">
                    <h5>Export realizado com sucesso!</h5>
                    <p>O SQL de todas as tabelas foi gerado no campo abaixo. Você pode copiar e usar para clonar o banco de dados.</p>
                </div>
                @endif

                <form action="{{ route('admin.sql-execute') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="sql">Consulta SQL:</label>
                        <textarea class="form-control" id="sql" name="sql" rows="8" placeholder="Digite sua consulta SQL aqui...">{{ old('sql', $sql ?? '') }}</textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            <i class="nc-icon nc-send"></i> Executar
                        </button> <button type="button" class="btn btn-secondary" onclick="document.getElementById('sql').value = ''">
                            <i class="nc-icon nc-simple-remove"></i> Limpar
                        </button>
                        <a href="{{ route('admin.sql-export-all') }}" class="btn btn-success">
                            <i class="nc-icon nc-cloud-download-93"></i> Exportar Todas as Tabelas
                        </a>
                        @if(isset($exported) && $exported)
                        <button type="button" class="btn btn-info" onclick="copiarSQL()">
                            <i class="nc-icon nc-paper-2"></i> Copiar SQL
                        </button>
                        @endif
                    </div>
                </form>

                @if(isset($error))
                <div class="alert alert-danger">
                    <h5>Erro na execução:</h5>
                    <pre>{{ $error }}</pre>
                </div>
                @endif
                @if(isset($results))
                <div class="card mt-4">
                    <div class="card-header">
                        <h5>Resultados SQL:</h5>
                    </div>
                    <div class="card-body">
                        @if(count($results) > 0)
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        @foreach(array_keys((array)$results[0]) as $column)
                                        <th>{{ $column }}</th>
                                        @endforeach
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($results as $row)
                                    <tr>
                                        @foreach((array)$row as $value)
                                        <td>
                                            @if(is_null($value))
                                            <span class="text-muted">NULL</span>
                                            @else
                                            {{ $value }}
                                            @endif
                                        </td>
                                        @endforeach
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="text-muted">
                            Registros retornados: {{ count($results) }}
                        </div>
                        @else
                        <div class="alert alert-info">Query executada com sucesso. Nenhum registro retornado.</div>
                        @endif
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')
<script>
    function copiarSQL() {
        const textarea = document.getElementById('sql');
        textarea.select();
        textarea.setSelectionRange(0, 99999); // Para dispositivos móveis

        try {
            document.execCommand('copy');
            alert('SQL copiado para a área de transferência!');
        } catch (err) {
            console.error('Erro ao copiar: ', err);
            alert('Erro ao copiar. Use Ctrl+A e Ctrl+C manualmente.');
        }
    }
</script>
@endsection