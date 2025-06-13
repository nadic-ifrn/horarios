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
                @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="nc-icon nc-check-2"></i> {{ session('success') }}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                @endif

                @if(session('error'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="nc-icon nc-simple-remove"></i> {{ session('error') }}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                @endif

                <div class="row mb-3">
                    <div class="col-md-6">
                        <a href="{{ route('admin.db-editor') }}" class="btn btn-info">
                            <i class="nc-icon nc-minimal-left"></i> Voltar ao Editor
                        </a>
                    </div>
                </div>
                <h5>Usuários Cadastrados:</h5>
                <div style="margin-bottom: 15px; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
                    <h6 style="color: #0056b3; margin-bottom: 10px;"><b><i class="nc-icon nc-alert-circle-i" style="margin-right: 5px;"></i>Informação:</b></h6>
                    <p style="margin-bottom: 0; color: #0056b3;">Administradores são aqueles que fazem parte da comissão.</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Matrícula</th>
                                <th>Status Administrativo <i class="nc-icon nc-alert-circle-i" title="Administradores são aqueles que fazem parte da comissão"></i></th>
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
                                    <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editModal{{ $professor->id }}">
                                        <i class="nc-icon nc-ruler-pencil"></i> Editar
                                    </a>
                                    <form action="{{ route('admin.destroy-user', $professor->id) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('Tem certeza que deseja remover este usuário? Esta ação não pode ser desfeita.')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="nc-icon nc-simple-remove"></i> Remover
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Modais de Edição -->
                @foreach($professores as $professor)
                <div class="modal fade" id="editModal{{ $professor->id }}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel{{ $professor->id }}" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel{{ $professor->id }}">Editar Status de {{ $professor->nome }}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="{{ route('admin.toggle-comissao', $professor->id) }}" method="POST">
                                @csrf
                                @method('PATCH')
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="status{{ $professor->id }}">Status Administrativo:</label>
                                        <select class="form-control" name="status" id="status{{ $professor->id }}">
                                            <option value="0" {{ !$professor->comissao ? 'selected' : '' }}>Professor</option>
                                            <option value="1" {{ $professor->comissao ? 'selected' : '' }}>Administrador (Comissão)</option>
                                        </select>
                                    </div>
                                    <div style="margin-bottom: 15px; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
                                        <h6 style="color: #0056b3; margin-bottom: 10px;"><b><i class="nc-icon nc-alert-circle-i" style="margin-right: 5px;"></i>Atenção:</b></h6>
                                        <p style="margin-bottom: 0; color: #0056b3;">Administradores têm acesso completo ao sistema administrativo.</p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                @endforeach @if($professores->count() == 0)
                <div style="margin-bottom: 15px; padding: 15px; background-color: #e7f3ff; border-left: 3px solid #007bff; border-radius: 5px;">
                    <h6 style="color: #0056b3; margin-bottom: 10px;"><b><i class="nc-icon nc-alert-circle-i" style="margin-right: 5px;"></i>Nenhum professor encontrado.</b></h6>
                    <p style="margin-bottom: 0; color: #0056b3;">Os professores são cadastrados automaticamente quando fazem login no sistema pela primeira vez.</p>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection