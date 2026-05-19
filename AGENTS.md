# AGENTS.md

This file gives Codex-oriented repository guidance for this project.

## Overview

Aplicação Laravel 11 com PHP 8.2+ para coletar a disponibilidade de docentes do IFRN por `AnoLetivo`. Os dados consolidados alimentam o software externo **TimeTables** para geração de horários do campus.

## Main Commands

### Docker

```bash
docker compose up --build
docker compose exec app php artisan migrate
docker compose exec app php artisan tinker
```

- A aplicação sobe com Apache na porta `8000`.
- O MariaDB expõe a porta `3306`.
- O `Dockerfile` limpa caches de rota/view/config no startup.
- `docker-compose.prod.yml` usa a imagem publicada em `ghcr.io/nadic-ifrn/horarios:latest`.

### Local

```bash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
npm install
npm run dev
```

### Testes e estilo

```bash
php artisan test
php artisan test --filter=NomeDoTeste
vendor/bin/phpunit
vendor/bin/pint
```

## Architecture Notes

### Laravel structure

- Os models ficam diretamente em `app/` sob o namespace `App\`.
- Não introduza `app/Models/` para mudanças pontuais; siga o padrão legado existente.

### Authentication

- O login não usa `Auth::user()` nem a tabela padrão `users`.
- `App\Classes\SUAPClient` autentica no SUAP e consulta `rh/meus-dados`.
- `App\Http\Controllers\UsuarioController::autenticar` valida `vinculo.campus` contra `config('app.campus')`.
- O usuário autenticado é salvo em `session('usuario')`.
- O privilégio administrativo é `professors.comissao`.
- `createOrUpdateProfessor` mantém um bypass hardcoded por matrícula; preserve isso até decisão explícita do usuário.
- O método `UsuarioController::autenticar` ainda contém um `dd()` de depuração no bloco de exceção. Isso é risco de produção e deve ser removido antes de merge/deploy.

### Middleware and routing

- O projeto usa middleware customizado, não o guard padrão do Laravel.
- `usuario:comum` exige sessão de usuário.
- `usuario:comissao` exige `session('usuario')->comissao == true`.
- `visitante` impede acesso às rotas de login quando já existe usuário autenticado.
- As rotas protegidas estão em [`routes/web.php`](/home/kellyson/Documentos/Github/Bolsa_NADIC/horarios/routes/web.php).

### Domain model

- Hierarquia principal: `Curso -> Periodo -> Disciplina`.
- `AnoLetivo -> Turma`.
- Cada `Professor` responde um `Dia` por `AnoLetivo`, com disponibilidade semanal, campo `especial`, `observacao` e `Anexo` opcional.
- As cargas declaradas viram registros em `Carga`, relacionando `Dia x Turma x Disciplina`.
- O fluxo principal de submissão está em `QuestionarioController::submeter`, que apaga e recria as `Carga`s a cada envio.

### Administrative area

- `AdminController` expõe `/admin/db-editor` para CRUD genérico de tabelas.
- `AdminController` expõe `/admin/sql-executor` para SQL arbitrário.
- Ambas as áreas são restritas a `comissao`.
- Novas tabelas precisam entrar no whitelist `$allowedTables` para aparecer no editor.

## Relevant Configuration

Além das variáveis padrão do Laravel:

- `APP_CAMPUS`: sigla do campus autorizada para login.
- `APP_PERIODOS_M`: quantidade de períodos da manhã.
- `APP_PERIODOS_T`: quantidade de períodos da tarde.
- `APP_PERIODOS_N`: quantidade de períodos da noite.

## Frontend

- Stack legada com Laravel Mix 4, Bootstrap 4, jQuery e Vue 2.
- Views Blade em `resources/views/`, organizadas por entidade.
- Assets compilam via `webpack.mix.js` com `npm run dev` e `npm run prod`.

## Working Rules For Codex

- Preserve o padrão legado do projeto antes de modernizar qualquer camada.
- Não troque autenticação customizada por mecanismos nativos do Laravel sem pedido explícito.
- Ao alterar login/autorização, confira impacto em `session('usuario')`, middleware customizado e campus SUAP.
- Ao alterar o admin, trate `db-editor` e `sql-executor` como áreas sensíveis.
- Ao adicionar tabelas administrativas, atualize o whitelist correspondente.
- Em mudanças de produção, remova qualquer debug remanescente como `dd()`.
