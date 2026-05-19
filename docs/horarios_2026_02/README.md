# Conferência Para Importação 2026.02

Este pacote não importa dados no banco. Ele consolida os documentos originais em arquivos de conferência para aprovação antes da carga no sistema.

## Arquivos Gerados

- `importacao_2026_02.csv`: base principal de disciplinas/turmas/cargas.
- `pendencias_criticas_2026_02.csv`: recorte das linhas que precisam de confirmação antes de importar.
- `professores_grupos_2026_02.csv`: disponibilidade por grupo de docentes.
- `professores_suap_2026.csv`: lista oficial de professores e matrículas do SUAP (fonte de dados).
- `turmas_referencia_2026_01.csv`: referência das turmas do documento 2026.01.

## Regras Aplicadas

- Linhas com `status=OK` e `importavel=SIM` (288) já foram mapeadas com a matrícula oficial do SUAP e estão prontas para carga.
- Dados ambíguos ou sem correspondência no SUAP foram marcados como `BLOQUEADO` ou `CONFIRMAR`.
- Disciplinas optativas foram mantidas como `OBSERVACAO`, sem importação.
- Disciplinas de 1º semestre do integrado foram mantidas como `OBSERVACAO`, fora da carga 2026.02.
- A página 30 do PDF foi tratada como `ADS6V`, com observação de cabeçalho ausente.

## Contagem Da Base Principal

- `BLOQUEADO`: 1
- `OBSERVACAO`: 79
- `OK`: 288
- Turmas/blocos detectados: 32

## Turmas/Blocos Detectados

ADS2V, ADS4V, ADS6V, ADS7V, AGRO2V, AGRO4N, AGRO6V, ALIMENTO1M, ALIMENTO2M, ALIMENTO2V, ALIMENTO3M, ALIMENTO3V, ALIMENTO4M, APICULTURA1M, APICULTURA1V, APICULTURA2M, APICULTURA2V, APICULTURA3M, APICULTURA4M, APICULTURA4V, ESPECIALIZAÇÃO 02 NOTURNA: EDUCAÇÃO E CONTEMPORANEIDADE, INFORMATICA1M, INFORMATICA1V, INFORMATICA2M, INFORMATICA3M, INFORMATICA3V, INFORMATICA4M, INFORMATICA4V, QUIMICA2V, QUIMICA4N, QUIMICA6V, QUIMICA8N

## Pendências Críticas

- Obter CSV/Excel oficial do SUAP com `nome` e `matricula` antes de liberar qualquer linha para importação.
- Confirmar todos os professores provisórios, visitantes, substitutos e em licença.
- Confirmar disciplinas com múltiplos professores antes de decidir se a carga será duplicada ou dividida.
- Conferir cargas com `EAD`, `sequenciais`, `0H` ou carga variável por semestre.
- Registrar no TimeTables restrições que o sistema atual não representa: superior vespertino 13:00-16:30 e especializações por dias específicos.

Linhas bloqueadas na base principal: 1.
Linhas com múltiplos professores: 0.
Disponibilidades bloqueadas na lista de grupos: 7.
