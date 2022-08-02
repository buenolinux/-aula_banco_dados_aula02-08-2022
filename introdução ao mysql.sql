CREATE DATABASE t18;
USE t18;
CREATE TABLE tab_alunos(
    id_aluno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email  VARCHAR(50)  NOT NULL,
    fone VARCHAR(15) NOT NULL
);

CREATE TABLE tab_professores(
	id_professor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fone VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);
CREATE TABLE tab_salas(
    id_sala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    capacidade INT NOT NULL,
    equipamento VARCHAR(3) NOT NULL
);
CREATE TABLE tab_turmas(
    id_turmas INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    id_sala INT NOT NULL,
    
    CONSTRAINT fk_id_aluno
    FOREIGN KEY (id_aluno)
    REFERENCES tab_alunos(id_aluno),
    
    CONSTRAINT fk_id_professor
    FOREIGN KEY(id_professor)
    REFERENCES tab_professores(id_professor),
    
    CONSTRAINT fk_id_sala
    FOREIGN KEY(id_sala)
    REFERENCES tab_salas(id_sala)
    
);
