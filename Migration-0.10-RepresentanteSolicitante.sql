-- Migração 0.10 — registra qual representante do cliente (pessoa_fisica) fez o contato/solicitou
-- a remoção, quando o pedido chega por telefone e é lançado pelo Regulador em nome de um Cliente PJ
-- já cadastrado. Independente de fk_cliente (a empresa) — este campo é só o "quem ligou".

ALTER TABLE "remocao" ADD COLUMN IF NOT EXISTS "fk_representante_solicitante" integer;
ALTER TABLE "remocao" ADD FOREIGN KEY ("fk_representante_solicitante") REFERENCES "pessoa_fisica" ("id");
COMMENT ON COLUMN "remocao"."fk_representante_solicitante" IS 'Representante do cliente que solicitou esta remoção (deve ser um dos vinculados em tb_associa_representantes_cliente); preenchido quando o Regulador lança um pedido recebido por telefone';
