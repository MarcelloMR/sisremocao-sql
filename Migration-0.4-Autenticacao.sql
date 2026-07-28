-- Migração 0.4 — Fundação de autenticação por usuário (pré-requisito para as 3 interfaces:
-- Portal do Cliente, Backoffice e App de Campo). Substitui o modelo de API key única
-- por login/senha por usuário com papel (role-based authorization).

DROP TYPE IF EXISTS "papel_usuario" CASCADE;
CREATE TYPE "papel_usuario" AS ENUM (
  'Cliente',
  'Profissional',
  'Regulador',
  'Gestor',
  'GestorAmbulancia',
  'Admin'
);

DROP TABLE IF EXISTS "usuario" CASCADE;
CREATE TABLE "usuario" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "email" varchar NOT NULL UNIQUE,
  "senha_hash" varchar NOT NULL,
  "papel" papel_usuario NOT NULL,
  "fk_pessoa_fisica" integer,
  "fk_cliente" integer,
  "ativo" boolean NOT NULL DEFAULT true,
  "criado_em" TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP
);

ALTER TABLE "usuario" ADD FOREIGN KEY ("fk_pessoa_fisica") REFERENCES "pessoa_fisica" ("id");
ALTER TABLE "usuario" ADD FOREIGN KEY ("fk_cliente") REFERENCES "cliente" ("id");

COMMENT ON TABLE "usuario" IS 'Conta de login. fk_pessoa_fisica identifica o profissional/pessoa dona da conta (papel Profissional); fk_cliente identifica a empresa cliente representada (papel Cliente). Papéis internos (Regulador/Gestor/GestorAmbulancia/Admin) não usam nenhum dos dois.';
COMMENT ON COLUMN "usuario"."papel" IS 'Define o que o usuário pode acessar nas 3 interfaces (Portal do Cliente, Backoffice, App de Campo)';
