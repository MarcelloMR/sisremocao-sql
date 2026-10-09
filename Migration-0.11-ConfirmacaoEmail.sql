-- Migração 0.11 — confirmação de e-mail no autocadastro (Cliente/Profissional): a conta nasce
-- inativa até o dono clicar no link enviado por e-mail, provando que o endereço é dele mesmo.

ALTER TABLE "usuario" ADD COLUMN IF NOT EXISTS "email_confirmado" boolean NOT NULL DEFAULT false;
ALTER TABLE "usuario" ADD COLUMN IF NOT EXISTS "token_confirmacao" varchar;
ALTER TABLE "usuario" ADD COLUMN IF NOT EXISTS "token_confirmacao_expira_em" TIMESTAMP;

COMMENT ON COLUMN "usuario"."email_confirmado" IS 'true quando o dono do e-mail clicou no link de confirmação enviado no autocadastro';
COMMENT ON COLUMN "usuario"."token_confirmacao" IS 'Token de confirmação de e-mail pendente (null após confirmado ou expirado/reemitido)';
COMMENT ON COLUMN "usuario"."token_confirmacao_expira_em" IS 'Validade do token_confirmacao';
