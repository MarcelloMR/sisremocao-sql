-- Migração 0.9 — gestão de vagas da equipe de remoção (candidatura do profissional + aprovação do Regulador).
--
-- Contexto: hoje a equipe é montada de uma vez só pelo Regulador (PUT /remocao, equipe_remocao sem
-- conceito de "vaga em aberto"). Esta migração introduz vagas individuais por função, preenchidas por
-- candidatura do profissional e aprovação do Regulador, mantendo equipe_remocao como está (ela grava a
-- equipe efetivamente confirmada; vaga_remocao é o processo de preenchimento).

CREATE TYPE "tipo_ambulancia_demandada" AS ENUM (
  'Basica',
  'UTI'
);
COMMENT ON TYPE "tipo_ambulancia_demandada" IS 'Define as vagas mínimas exigidas: Basica = Motorista+Tecnico_Enfermagem; UTI = Motorista+Medico+Enfermeiro';

CREATE TYPE "status_vaga_remocao" AS ENUM (
  'Aberta',
  'Pendente',
  'Preenchida',
  'Recusada'
);

ALTER TABLE "remocao" ADD COLUMN IF NOT EXISTS "tipo_ambulancia_demandada" tipo_ambulancia_demandada;
ALTER TABLE "remocao" ADD COLUMN IF NOT EXISTS "escalacao_fechada" boolean NOT NULL DEFAULT false;
COMMENT ON COLUMN "remocao"."tipo_ambulancia_demandada" IS 'Definido pelo Regulador ao abrir as vagas; independe da ambulância já estar alocada';
COMMENT ON COLUMN "remocao"."escalacao_fechada" IS 'true = fechada manualmente pelo Regulador; trava novas candidaturas, só backoffice altera a equipe';

ALTER TABLE "profissional" ADD COLUMN IF NOT EXISTS "peso_prioridade" integer NOT NULL DEFAULT 0;
COMMENT ON COLUMN "profissional"."peso_prioridade" IS 'Fator de ponderação (maior = mais prioridade) usado para ordenar sugestões de candidatos às vagas; ajustável só pelo backoffice (Admin/Regulador)';

DROP TABLE IF EXISTS "vaga_remocao" CASCADE;
CREATE TABLE "vaga_remocao" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "fk_remocao" integer NOT NULL,
  "tipo_profissional" tipo_profissional NOT NULL,
  "status" status_vaga_remocao NOT NULL DEFAULT 'Aberta',
  "fk_profissional_candidato" integer,
  "fk_profissional_aprovado" integer,
  "data_hora_candidatura" TIMESTAMP,
  "data_hora_decisao" TIMESTAMP
);

ALTER TABLE "vaga_remocao" ADD FOREIGN KEY ("fk_remocao") REFERENCES "remocao" ("id");
ALTER TABLE "vaga_remocao" ADD FOREIGN KEY ("fk_profissional_candidato") REFERENCES "profissional" ("id");
ALTER TABLE "vaga_remocao" ADD FOREIGN KEY ("fk_profissional_aprovado") REFERENCES "profissional" ("id");

COMMENT ON COLUMN "vaga_remocao"."fk_profissional_candidato" IS 'Quem submeteu a candidatura (status Pendente); pode diferir do aprovado se o Regulador escalar outra pessoa';
COMMENT ON COLUMN "vaga_remocao"."fk_profissional_aprovado" IS 'Preenchido quando o Regulador aprova (status Preenchida); é quem efetivamente compõe a equipe';
