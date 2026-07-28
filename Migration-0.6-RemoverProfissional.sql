-- Migração 0.6 — "remover" profissional é soft delete (ativo=false), não DELETE físico: preserva
-- histórico de remoções/disponibilidade/dados bancários que referenciam o profissional.

ALTER TABLE "profissional" ADD COLUMN IF NOT EXISTS "ativo" boolean NOT NULL DEFAULT true;
COMMENT ON COLUMN "profissional"."ativo" IS 'false = removido (soft delete); preserva histórico referenciado em remoções passadas';
