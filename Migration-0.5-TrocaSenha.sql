-- Migração 0.5 — senha temporária no primeiro acesso: quando o Backoffice cadastra um profissional,
-- o sistema cria a conta de login automaticamente com uma senha gerada e força a troca no 1º login.

ALTER TABLE "usuario" ADD COLUMN IF NOT EXISTS "deve_trocar_senha" boolean NOT NULL DEFAULT false;
COMMENT ON COLUMN "usuario"."deve_trocar_senha" IS 'true quando a senha atual foi gerada pelo sistema (ex: cadastro de profissional pelo Admin) e ainda não foi trocada pelo usuário';
