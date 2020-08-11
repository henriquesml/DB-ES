/*SCRIPT MYSQL*/

CREATE DATABASE PesquisaUniville;
USE PesquisaUniville;

CREATE TABLE bairros
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    nome VARCHAR(40),
    zona VARCHAR(6)
);

CREATE TABLE pessoas
(
    id INT auto_increment, CONSTRAINT PRIMARY KEY (id),
    nome VARCHAR(40),
    idade INT,
    sexo VARCHAR(1),
    bairro_id INT, CONSTRAINT FOREIGN KEY (bairro_id)
        REFERENCES bairros(id)
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

INSERT bairros (nome, zona) VALUES ('Profipo', 'SUL');
INSERT bairros (nome, zona) VALUES ('Centro', 'CENTRO');

INSERT pessoas (nome, idade, sexo, bairro_id) VALUES ('Henrique Schmeller', 20, 'M', 1);
INSERT pessoas (nome, idade, sexo, bairro_id) VALUES ('Gabriela Schmeller', 20, 'F', 1);
INSERT pessoas (nome, idade, sexo, bairro_id) VALUES ('Jesus Apaga a Luz', 2020, 'M', 1);
INSERT pessoas (nome, idade, sexo, bairro_id) VALUES ('Desconhecido', 17, 'F', 2);
INSERT pessoas (nome, idade, sexo, bairro_id) VALUES ('Dornel cada de pastel', 18, 'M', 2);

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

/*Respota Henrique*/
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 1, 1, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 2, 1, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 3, 1, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 4, 1, 'Sim', (SELECT CURDATE()));

/*Respota Gabriela*/
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 1, 2, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 2, 2, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 3, 2, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 4, 2, 'Sim', (SELECT CURDATE()));

/*Respota Jesus Apaga a Luz*/
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 1, 3, 'Meu pai criou Joinville', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 2, 3, 'Meu pai criou o clima', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 3, 3, 'Moro no céu com meu pai', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (1, 4, 3, 'Sim, no mundo todo', (SELECT CURDATE()));

/*Respota Desconhecido*/
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 1, 4, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 2, 4, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 3, 4, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 4, 4, 'Não', (SELECT CURDATE()));

INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 1, 5, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 2, 5, 'Não', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 3, 5, 'Sim', (SELECT CURDATE()));
INSERT respostas_perguntas (questionario_id, pergunta_id, pessoa_id, resposta, data_coleta) VALUES (2, 4, 5, 'Não', (SELECT CURDATE()));

/* ------------------------------------------ CRIAÇÃO DAS VIEWS ------------------------------------------ */

USE PesquisaUniville;

/*Quantidade de perguntas respondidas por pessoa*/
CREATE VIEW view_quantidade_de_respostas_por_pessoa AS
SELECT pessoas.nome, count(respostas_perguntas.resposta) AS Total_de_respostas FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
group by pessoas.nome;

/*Quantidade de perguntas em cada questionário*/
CREATE VIEW view_quantidade_de_perguntas_por_questionario AS
SELECT questionarios.titulo, count(perguntas.id) AS Total_de_respostas FROM perguntas
iNNER JOIN perguntas_questionario ON perguntas_questionario.pergunta_id = perguntas.id
iNNER JOIN questionarios ON questionarios.id = perguntas_questionario.questionario_id
group by questionarios.titulo;

/*Resposta das perguntas por pessoa*/
CREATE VIEW view_repostas_das_perguntas_por_pessoa AS
SELECT perguntas.titulo, pessoas.nome, respostas_perguntas.resposta FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
group by perguntas.titulo, pessoas.nome, respostas_perguntas.resposta;

/*Quantidade de resposta por sexo*/
CREATE VIEW view_quantidade_de_resposta_por_sexo AS
SELECT count(respostas_perguntas.resposta) as Total_de_resposta ,
CASE 
    WHEN pessoas.sexo = 'M' THEN 'Masculino'
    ELSE 'Feminino'
END AS 'Sexo'
FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
group by pessoas.sexo;

/*Quantidade de resposta por bairro*/
CREATE VIEW view_quantidade_de_resosta_por_bairro AS
SELECT bairros.nome, bairros.zona, count(respostas_perguntas.resposta) as Total_de_resposta FROM perguntas
iNNER JOIN respostas_perguntas ON respostas_perguntas.pergunta_id = perguntas.id
iNNER JOIN pessoas ON pessoas.id = respostas_perguntas.pessoa_id
iNNER JOIN bairros ON bairros.id = pessoas.bairro_id
group by bairros.nome, bairros.zona

/*Quantidade de pessoas que gostam de morar em joinville*/
SELECT bairros.nome AS Bairro, COUNT(respostas_perguntas.id) AS Quantidade FROM respostas_perguntas
iNNER JOIN pessoas on pessoas.id = respostas_perguntas.pessoa_id
iNNER JOIN bairros on bairros.id = pessoas.bairro_id
iNNER JOIN perguntas on perguntas.id = respostas_perguntas.pergunta_id
WHERE perguntas.id = 1 AND respostas_perguntas.resposta = "sim"
GROUP BY bairros.nome

/*Quantidade de respostas para sim e não que gostam de morar em joinville*/
SELECT bairros.nome AS Bairro, COUNT(respostas_perguntas.resposta = "sim") AS SIM, COUNT(respostas_perguntas.resposta = "não") AS NÃO, COUNT(respostas_perguntas.id) AS Quantidade FROM respostas_perguntas
iNNER JOIN pessoas on pessoas.id = respostas_perguntas.pessoa_id
iNNER JOIN bairros on bairros.id = pessoas.bairro_id
iNNER JOIN perguntas on perguntas.id = respostas_perguntas.pergunta_id
WHERE perguntas.id = 1
GROUP BY bairros.nome, respostas_perguntas.resposta
ORDER BY bairros.nome

/* ------------------------------------------ CONSULTA NAS VIEWS ------------------------------------------ */

SELECT * FROM view_quantidade_de_respostas_por_pessoa;
SELECT * FROM view_quantidade_de_perguntas_por_questionario;
SELECT * FROM view_repostas_das_perguntas_por_pessoa;
SELECT * FROM view_quantidade_de_resposta_por_sexo;
SELECT * FROM view_quantidade_de_resosta_por_bairro;
