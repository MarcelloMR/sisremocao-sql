-- Migração 0.7 — garante no banco (não só na aplicação):
-- 1) CPF não se repete entre pessoas físicas (permite múltiplos NULL, ex: paciente/representante sem CPF)
-- 2) Relação 1:1 entre profissional e pessoa_fisica (uma pessoa física não pode virar dois profissionais)

ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "pessoa_fisica_cpf_key" UNIQUE ("cpf");
ALTER TABLE "profissional" ADD CONSTRAINT "profissional_fk_dados_pessoais_key" UNIQUE ("fk_dados_pessoais");
