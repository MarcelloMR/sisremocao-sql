-- Migração 0.2 — corrige divergências entre o schema e o Modelo de Entidade/Regras de Negócio:
-- RNPL001 (placa alfanumérica), RNRE003 (dataHoraAtendimento), RNRE006 (origem/destino por endereço avulso)

ALTER TABLE "carro"
  ALTER COLUMN "placa_identificador" TYPE varchar(7) USING placa_identificador::varchar(7);
COMMENT ON COLUMN "carro"."placa_identificador" IS 'RNPL001: 3 letras + 4 números, sem hífen (ex: ABC1234)';

ALTER TABLE "remocao"
  ADD COLUMN "data_hora_atendimento" TIMESTAMP,
  ADD COLUMN "fk_endereco_origem" integer,
  ADD COLUMN "fk_endereco_destino" integer;

ALTER TABLE "remocao" ADD FOREIGN KEY ("fk_endereco_origem") REFERENCES "endereco" ("id");
ALTER TABLE "remocao" ADD FOREIGN KEY ("fk_endereco_destino") REFERENCES "endereco" ("id");

COMMENT ON COLUMN "remocao"."data_hora_atendimento" IS 'RNRE003: momento em que a equipe saiu em direção ao atendimento';
COMMENT ON COLUMN "remocao"."fk_endereco_origem" IS 'RNRE006: usado quando a origem não é um hospital';
COMMENT ON COLUMN "remocao"."fk_endereco_destino" IS 'RNRE006: usado quando o destino não é um hospital';
