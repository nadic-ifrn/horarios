<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class CorrecaoEliaquim20262Controller extends Controller
{
    public function index()
    {
        return view('admin.correcao-eliaquim.index');
    }

    public function executar()
    {
        $statements = $this->buildStatements();
        $executed = 0;
        $error = null;

        try {
            DB::statement('SET FOREIGN_KEY_CHECKS=0');
            foreach ($statements as $sql) {
                DB::statement($sql);
                $executed++;
            }
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
        } catch (\Exception $e) {
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
            $error = "Erro no statement #{$executed}: " . $e->getMessage();
        }

        return view('admin.correcao-eliaquim.index', [
            'executed' => $executed,
            'total'    => count($statements),
            'error'    => $error,
        ]);
    }

    private function buildStatements(): array
    {
        $s = [];
        $ano   = "(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2)";
        $prof  = "(SELECT id FROM professors WHERE matricula='1310276')";
        $diaId = "(SELECT id FROM dias WHERE professor_id={$prof} AND ano_letivo_id={$ano})";
        $apiP2 = "(SELECT id FROM periodos WHERE ordem=2 AND curso_id=(SELECT id FROM cursos WHERE sigla='API'))";

        // 1. Garante Biologia - Vida e Diversidade no API 2º (se já existir, não duplica)
        $s[] = "INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at)
                SELECT 'Biologia - Vida e Diversidade', 2, {$apiP2}, NOW(), NOW()
                WHERE NOT EXISTS (
                    SELECT 1 FROM disciplinas
                    WHERE nome='Biologia - Vida e Diversidade' AND periodo_id={$apiP2}
                )";

        // 2. Garante que Eliaquim tem Dia em 2026.2 (não sobrescreve se já respondeu)
        $s[] = "INSERT INTO dias (seg,ter,qua,qui,sex,especial,observacao,ano_letivo_id,professor_id,created_at,updated_at)
                SELECT 0,0,0,0,0,0,NULL,{$ano},{$prof},NOW(),NOW()
                WHERE NOT EXISTS (
                    SELECT 1 FROM dias WHERE professor_id={$prof} AND ano_letivo_id={$ano}
                )";

        // 3. Apaga APENAS as cargas do Eliaquim (outros professores não são afetados)
        $s[] = "DELETE FROM cargas WHERE dia_id={$diaId}";

        // 4. Insere cargas corretas do Eliaquim
        foreach ($this->getCargas() as [$sigla, $ordem, $turno, $disc]) {
            $turmaId = $this->turmaSub($sigla, $ordem, $turno);
            $discId  = $this->discSub($sigla, $ordem, $disc);
            $s[] = "INSERT INTO cargas (observacao,turma_id,disciplina_id,dia_id,created_at,updated_at)
                    VALUES (NULL,{$turmaId},{$discId},{$diaId},NOW(),NOW())";
        }

        return $s;
    }

    private function getCargas(): array
    {
        // [sigla_curso, ordem_periodo, turno_turma, nome_disciplina]
        return [
            ['INF',  1, 'T', 'Sociologia I'],
            ['INF',  3, 'T', 'Sociologia III'],
            ['ALI',  3, 'T', 'Sociologia III'],
            ['API',  4, 'T', 'Sociologia do Trabalho'],
            ['AGRO', 4, 'N', 'Sociologia do Trabalho'],
            ['AGRO', 2, 'T', 'Introdução à Extensão'],
            ['ESP',  2, 'N', 'Ciência, Tecnologia e Sociedade'],
        ];
    }

    private function periodoSub(string $sigla, int $ordem): string
    {
        return "(SELECT id FROM periodos WHERE ordem={$ordem} AND curso_id=(SELECT id FROM cursos WHERE sigla='{$sigla}'))";
    }

    private function turmaSub(string $sigla, int $ordem, string $turno): string
    {
        $ano = "(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2)";
        $per = $this->periodoSub($sigla, $ordem);
        return "(SELECT id FROM turmas WHERE turno='{$turno}' AND periodo_id={$per} AND ano_letivo_id={$ano})";
    }

    private function discSub(string $sigla, int $ordem, string $nome): string
    {
        $per = $this->periodoSub($sigla, $ordem);
        return "(SELECT id FROM disciplinas WHERE nome='" . addslashes($nome) . "' AND periodo_id={$per})";
    }
}
