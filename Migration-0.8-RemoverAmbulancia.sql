-- Migração 0.8 — soft delete de ambulância, no mesmo padrão de "profissional.ativo".
-- O enum ambulancia_status representa o estado operacional (Disponivel/Ocupada/Revisao_Oficina/Alugada)
-- e não deve ser reaproveitado para remoção lógica: "ativo" é o campo de remoção, independente do status.

ALTER TABLE "ambulancia" ADD COLUMN IF NOT EXISTS "ativo" boolean NOT NULL DEFAULT true;
COMMENT ON COLUMN "ambulancia"."ativo" IS 'Soft delete: false = ambulância removida (histórico de remoções preservado)';
