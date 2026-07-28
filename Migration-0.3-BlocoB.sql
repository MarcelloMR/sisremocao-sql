-- Migração 0.3 — Bloco B: RNCA002 (seguro/apólice + lembrete), RNCL001/RNCL003 (cliente anônimo),
-- e composição obrigatória da equipe de remoção (motorista + técnico sempre; médico se UTI móvel)

-- RNCA002: substitui o boolean "seguro" por uma entidade de apólice com vigência
DROP TABLE IF EXISTS "seguro" CASCADE;
CREATE TABLE "seguro" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "fk_carro" integer NOT NULL,
  "numero_apolice" varchar NOT NULL,
  "seguradora" varchar NOT NULL,
  "data_inicio" date NOT NULL,
  "data_fim" date NOT NULL
);
ALTER TABLE "seguro" ADD FOREIGN KEY ("fk_carro") REFERENCES "carro" ("id");
COMMENT ON TABLE "seguro" IS 'RNCA002: apólices de seguro do carro, usadas para alertar vencimento';

ALTER TABLE "carro" DROP COLUMN IF EXISTS "seguro";

-- Entidade Ambulância: sinaliza se é UTI móvel (exige médico na equipe — regra de negócio combinada com RNPR001)
ALTER TABLE "ambulancia" ADD COLUMN IF NOT EXISTS "uti_movel" boolean NOT NULL DEFAULT false;
COMMENT ON COLUMN "ambulancia"."uti_movel" IS 'Se true, a equipe da remoção exige um médico além de motorista e técnico';

-- RNCL001/RNCL003: cliente anônimo não gera registro em "cliente" — dados ficam na própria remoção
ALTER TABLE "remocao" ADD COLUMN IF NOT EXISTS "cliente_anonimo_nome" varchar;
ALTER TABLE "remocao" ADD COLUMN IF NOT EXISTS "cliente_anonimo_telefone" json;
ALTER TABLE "remocao" ALTER COLUMN "fk_cliente" DROP NOT NULL;
COMMENT ON COLUMN "remocao"."cliente_anonimo_nome" IS 'RNCL003: preenchido quando não há cliente cadastrado (fk_cliente nulo)';
COMMENT ON COLUMN "remocao"."cliente_anonimo_telefone" IS 'RNCL003: obrigatório junto de cliente_anonimo_nome quando o cliente é anônimo';
