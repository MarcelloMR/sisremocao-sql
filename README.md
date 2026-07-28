# sisRemoção — Camada de Dados (SQL)

Scripts de schema e migrações do banco PostgreSQL do sisRemoção.

## Ordem de aplicação

1. `SISRemocao DB DIagram_v0.0.1.sql` — schema base (tipos, tabelas, dados de referência: países, UFs, municípios).
2. `PopulateDB.sql` — dados de exemplo/seed (opcional, ambiente de desenvolvimento).
3. Migrações, em ordem numérica:
   - `Migration-0.2-GapFixes.sql`
   - `Migration-0.3-BlocoB.sql`
   - `Migration-0.4-Autenticacao.sql`
   - `Migration-0.5-TrocaSenha.sql`
   - `Migration-0.6-RemoverProfissional.sql`
   - `Migration-0.7-CpfUnicoRelacao1Para1.sql`
   - `Migration-0.8-RemoverAmbulancia.sql`
   - `Migration-0.9-VagasRemocao.sql`

## Aplicando via Docker (Postgres local)

```powershell
docker cp "caminho\para\arquivo.sql" postgres-sisremocaop:/tmp/arquivo.sql
docker exec postgres-sisremocaop psql -U postgres -d siscuidardb -f /tmp/arquivo.sql
```

Repositório da API que consome este schema: [sisremocao](https://github.com/MarcelloMR/sisremocao).
