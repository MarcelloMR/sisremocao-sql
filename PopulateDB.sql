WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Fulano',
            'de Tal',
            '21/05/1985',
            '12345678911',
            'Masculino',
            'xxxx@xxx.xxx',
            'Rua abc',
             47,
            'n/a',
            'bairro ijk',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 61,
                "numero": 981413323,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Motorista', '465489198126515', 'N/A', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('sabado', '00:00', '23:59'),
    ('domingo', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Bethania',
            'W Ferraz',
            '22/03/1989',
            '12309784702',
            'Feminino',
            'bethania_ferraz@hotmail.com',
            'Rua Senhor dos Passos',
             35,
            'n/a',
            'Centro',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 21,
                "numero": 981663969,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Medico', '12345678', 'Cardiologista', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('segunda', '00:00', '23:59'),
    ('terca', '00:00', '23:59'),
    ('quarta', '00:00', '23:59'),
    ('quinta', '00:00', '08:00'),
    ('sexta', '08:00', '00:00'),
    ('sabado', '00:00', '23:59'),
    ('domingo', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Vaanessa',
            'W Ferraz',
            '07/06/1984',
            '98765432111',
            'Feminino',
            'vanesssa_ferraz78@hotmail.com',
            'Rua Senhor dos Passos',
             35,
            'n/a',
            'Centro',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 21,
                "numero": 981663969,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Medico', '87654321', 'Cardiologista', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('segunda', '00:00', '23:59'),
    ('quinta', '00:00', '00:19'),
    ('sexta', '08:00', '00:00'),
    ('sabado', '00:00', '23:59'),
    ('domingo', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Alan Jones',
            'Menezes',
            '23/01/1999',
            '98765432111',
            'Masculino',
            'alan.jones@hotmail.com',
            'Rua Senhor dos Passos',
             48,
            'n/a',
            'Centro',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 22,
                "numero": 998929122,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Tecnico_Enfermagem', '87654321', 'N/a', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('segunda', '00:00', '23:59'),
    ('terca', '00:00', '23:59'),
    ('quarta', '00:00', '23:59'),
    ('quinta', '00:00', '00:19'),
    ('sexta', '08:00', '00:00'),
    ('sabado', '00:00', '23:59'),
    ('domingo', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'José',
            'da Silva',
            '14/08/1995',
            '12312312318',
            'Masculino',
            'jose.silva@hotmail.com',
            'Avenida 18 de Julho',
             51,
            'n/a',
            'Praça da Bandeira',
            '366660000',
            1555,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 32,
                "numero": 998959892,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Motorista', '456789456', 'N/a', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('terca', '00:00', '23:59'),
    ('quinta', '00:00', '00:19'),
    ('sexta', '08:00', '00:00')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Marcia',
            'Borges',
            '09/09/1978',
            '36925874111',
            'Feminino',
            'marcia.amelia@hotmail.com',
            'Rua das macieiras',
             25,
            '104',
            'Botafogo',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 22,
                "numero": 998929122,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Enfermeiro', '87654321', 'N/a', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('terca', '00:00', '23:59'),
    ('quarta', '00:00', '23:59'),
    ('quinta', '00:00', '00:19'),
    ('sabado', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);

WITH pessoa AS (
    INSERT INTO pessoa_fisica (
        nome,
        sobrenome,
        data_nascimento,
        cpf,
        sexo,
        email,
        logradouro,
        numero,
        complemento,
        bairro,
        cep,
        fk_municipio,
        role,
        telefone)
        VALUES (
            'Adaquir José',
            'Rocha Ferraz',
            '19/01/1970',
            '15935785264',
            'Masculino',
            'adaquir.ferraz@gmail.com',
            'Rua senhor dos passos',
             35,
            'N/a',
            'Centro',
            '28640000',
            3583,
            'Profissional',
            '{
                "tipo": "Celular",
                "preferencial": true,
                "ddd": 22,
                "numero": 995471245,
                "possuiWhatsapp": true
             }') RETURNING id
), prof AS (
    INSERT INTO profissional (tipo, numero_registro_conselho, especialidade, fk_dados_pessoais)
    SELECT 'Motorista', '124587896325874', 'N/a', id FROM pessoa
    RETURNING id
)
INSERT INTO disponibilidade (fk_profissional, dia_semana, hora_inicio, hora_fim)
SELECT prof.id, v.dia_semana::dia_semana, v.hora_inicio, v.hora_fim
FROM prof, (VALUES
    ('terca', '00:00', '23:59'),
    ('quarta', '00:00', '23:59'),
    ('quinta', '00:00', '00:19'),
    ('sabado', '00:00', '23:59')
) AS v(dia_semana, hora_inicio, hora_fim);
