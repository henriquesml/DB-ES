/*SCRIPT MYSQL*/
CREATE DATABASE PesquisaUniville;
USE PesquisaUniville;

CREATE TABLE cidades
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    nome VARCHAR(40),
    estado VARCHAR(2)
);

CREATE TABLE pessoas
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    nome VARCHAR(40),
    idade INT,
    sexo VARCHAR(1),
    cidade_id INT, CONSTRAINT FOREIGN KEY (cidade_id)
        REFERENCES cidades(id)
);

CREATE TABLE questionarios
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    titulo VARCHAR(60)

);

CREATE TABLE perguntas
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    titulo VARCHAR(60)

);

CREATE TABLE perguntas_questionario
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    questionario_id INT, CONSTRAINT FOREIGN KEY (questionario_id)
        REFERENCES questionarios(id),
    pergunta_id INT, CONSTRAINT FOREIGN KEY (pergunta_id)
        REFERENCES perguntas(id)
);

CREATE TABLE respostas_perguntas
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    resposta VARCHAR(40),
    data_coleta date,
    questionario_id INT, CONSTRAINT FOREIGN KEY (questionario_id)
        REFERENCES questionarios(id),
    pergunta_id INT, CONSTRAINT FOREIGN KEY (pergunta_id)
        REFERENCES perguntas(id),
    pessoa_id INT, CONSTRAINT FOREIGN KEY (pessoa_id)
        REFERENCES pessoas(id)
);

INSERT cidades (nome, estado) VALUES ('joinville', 'SC');

INSERT pessoas (nome, idade, sexo, cidade_id) VALUES ('Henrique Schmeller', 20, 'M', 1);
INSERT pessoas (nome, idade, sexo, cidade_id) VALUES ('Gabriela Schmeller', 20, 'F', 1);

INSERT questionarios (titulo) VALUES ('Pergunas Sobre Joinville');
INSERT questionarios (titulo) VALUES ('Pergunas Sobre Joinville 2');

INSERT perguntas (titulo) VALUES ('Gosta de morar em Joinville?');
INSERT perguntas (titulo) VALUES ('Gosta do clima de Joinville?');
INSERT perguntas (titulo) VALUES ('Mora em Joinville há mais de 5 anos?');
INSERT perguntas (titulo) VALUES ('Você tem família aqui (Qualquer grau)');

INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (1, 1);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (1, 2);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (1, 3);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (1, 4);

INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (2, 1);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (2, 2);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (2, 3);
INSERT perguntas_questionario (questionario_id, pergunta_id) VALUES (2, 4);

INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 1, 1, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 2, 1, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 3, 1, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 4, 1, 'Sim', (SELECT CURDATE()));

INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 1, 2, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 2, 2, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 3, 2, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 4, 2, 'Sim', (SELECT CURDATE()));

USE PesquisaUniville;

/*Quantidade de perguntas respondidas por pessoa*/
SELECT pessoas.nome, count(resposta) AS Total_de_respostas FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
group by pessoas.nome;

/*Quantidade de perguntas em cada questionário*/
SELECT questionarios.titulo, count(perguntas.id) AS Total_de_respostas FROM perguntas
iNNER JOIN perguntas_questionario ON perguntas_questionario.pergunta_id = perguntas.id
iNNER JOIN questionarios ON questionarios.id = perguntas_questionario.questionario_id
group by questionarios.titulo;

/*Resposta das perguntas por pessoa*/
SELECT pessoas.nome, perguntas.titulo, respostas_perguntas.resposta FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
group by pessoas.nome, perguntas.titulo, respostas_perguntas.resposta;