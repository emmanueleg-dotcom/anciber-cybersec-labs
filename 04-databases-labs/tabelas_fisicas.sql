-- 1. Tabela CURSO
CREATE TABLE Curso (
    sigla VARCHAR(10),
    nome VARCHAR(100) NOT NULL,
    minimo_creditos INT NOT NULL,
    PRIMARY KEY (sigla)
);

-- 2. Tabela ALUNO (Relação 1:N com Curso)
CREATE TABLE Aluno (
    numero_interno INT,
    nome VARCHAR(100) NOT NULL,
    fk_sigla_curso VARCHAR(10),
    PRIMARY KEY (numero_interno),
    FOREIGN KEY (fk_sigla_curso) REFERENCES Curso(sigla)
        ON DELETE NO ACTION
);

-- 3. Tabela DISCIPLINA
CREATE TABLE Disciplina (
    codigo VARCHAR(20),
    nome VARCHAR(100) NOT NULL,
    numero_creditos INT NOT NULL,
    PRIMARY KEY (codigo)
);

-- 4. Tabela ORGANISMO
CREATE TABLE Organismo (
    nome VARCHAR(100),
    telefone VARCHAR(20),
    PRIMARY KEY (nome)
);

-- 5. Tabela SUPERVISOR (Relação 1:N com Organismo)
CREATE TABLE Supervisor (
    NIC VARCHAR(20),
    nome VARCHAR(100) NOT NULL,
    fk_nome_organismo VARCHAR(100),
    PRIMARY KEY (NIC),
    FOREIGN KEY (fk_nome_organismo) REFERENCES Organismo(nome)
        ON DELETE NO ACTION
);

-- 6. Tabela ESTÁGIO (Relação 1:N com Organismo e Supervisor)
CREATE TABLE Estagio (
    codigo INT,
    area VARCHAR(50) NOT NULL,
    tema VARCHAR(100) NOT NULL,
    orientador_no_DI VARCHAR(100) NOT NULL,
    fk_nome_organismo VARCHAR(100),
    fk_NIC_supervisor VARCHAR(20),
    PRIMARY KEY (codigo),
    FOREIGN KEY (fk_nome_organismo) REFERENCES Organismo(nome)
        ON DELETE NO ACTION,
    FOREIGN KEY (fk_NIC_supervisor) REFERENCES Supervisor(NIC)
        ON DELETE NO ACTION
);

-- =====================================================================
-- TABELAS DE ASSOCIAÇÃO (MUITOS-PARA-MUITOS E TERNÁRIAS)
-- =====================================================================

-- 7. Tabela INSCRITO (M:N entre Aluno e Disciplina)
CREATE TABLE Inscrito (
    fk_numero_interno_aluno INT,
    fk_codigo_disciplina VARCHAR(20),
    PRIMARY KEY (fk_numero_interno_aluno, fk_codigo_disciplina),
    FOREIGN KEY (fk_numero_interno_aluno) REFERENCES Aluno(numero_interno)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_codigo_disciplina) REFERENCES Disciplina(codigo)
        ON DELETE NO ACTION
);

-- 8. Tabela APROVADO (M:N com atributo Classificação)
CREATE TABLE Aprovado (
    fk_numero_interno_aluno INT,
    fk_codigo_disciplina VARCHAR(20),
    classificacao INT NOT NULL,
    PRIMARY KEY (fk_numero_interno_aluno, fk_codigo_disciplina),
    FOREIGN KEY (fk_numero_interno_aluno) REFERENCES Aluno(numero_interno)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_codigo_disciplina) REFERENCES Disciplina(codigo)
        ON DELETE NO ACTION
);

-- 9. Tabela ESCOLHE (Associação Ternária com Ordem de Preferência)
CREATE TABLE Escolhe (
    fk_numero_interno_aluno INT,
    fk_codigo_estagio INT,
    ordem_preferencia INT NOT NULL,
    PRIMARY KEY (fk_numero_interno_aluno, fk_codigo_estagio),
    FOREIGN KEY (fk_numero_interno_aluno) REFERENCES Aluno(numero_interno)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_codigo_estagio) REFERENCES Estagio(codigo)
        ON DELETE CASCADE
);

-- 10. Tabela ATRIBUÍDO (Alocação final)
CREATE TABLE Atribuido (
    fk_codigo_estagio INT,
    fk_numero_interno_aluno INT NOT NULL,
    PRIMARY KEY (fk_codigo_estagio),
    FOREIGN KEY (fk_codigo_estagio) REFERENCES Estagio(codigo)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_numero_interno_aluno) REFERENCES Aluno(numero_interno)
        ON DELETE CASCADE
);
