CREATE DATABASE projetos
GO
USE projetos
GO

CREATE TABLE projects(
id					INT				NOT NULL		IDENTITY(10001,1),
nome				VARCHAR(45)		NOT NULL,
descricao			VARCHAR(45)		NULL,
data_proj			VARCHAR(45)		NOT NULL		CHECK(data_proj > '2014-09-01')
PRIMARY KEY(id)
)

CREATE TABLE users(
id					INT				NOT NULL		IDENTITY,
nome				VARCHAR(45)		NOT NULL,
username			VARCHAR(45)		NOT NULL		UNIQUE,
senha				VARCHAR(45)		NOT NULL		DEFAULT('123mudar'),
email				VARCHAR(45)		NOT NULL
PRIMARY KEY(id)
)

--TRUNCATE TABLE projects
--TRUNCATE TABLE users

CREATE TABLE user_has_projects(
users_id			INT				NOT NULL,
projects_id			INT				NOT NULL
PRIMARY KEY(users_id, projects_id)
FOREIGN KEY(users_id) REFERENCES users(id),
FOREIGN KEY(projects_id) REFERENCES projects(id)
)

--TRUNCATE TABLE user_has_projects

--DROP TABLE user_has_projects
--TRUNCATE TABLE USERS

-----------------------------------------------------------
--REMOVER PRIMEIRO O UNIQUE
ALTER TABLE users
DROP CONSTRAINT UQ__users__F3DBC57245F192CE
--ALTERAR O VARCHAR
ALTER TABLE users
ALTER COLUMN username VARCHAR(10) NOT NULL
--COLOCAR NOVAMENTE O UNIQUE
ALTER TABLE users
ADD CONSTRAINT UQ__users__F3DBC57245F192CE UNIQUE(username)
-----------------------------------------------------------

ALTER TABLE users
ALTER COLUMN senha VARCHAR(8) NOT NULL

--ALTER TABLE users
--ADD DEFAULT('123mudar') FOR senha

INSERT INTO users(nome,username,senha,email)
VALUES
('Maria','Rh_maria', '123mudar','maria@empresa.com'),
('Paulo','Ti_paulo','123@456','paulo@empresa.com'),
('Ana','Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara','Ti_clara','123mudar','clara@empresa.com'),
('Aparecido','Rh_apareci','123mudar','aparecido@empresa.com')

INSERT INTO projects(nome,descricao,data_proj)
VALUES
('Re-folha','Refatoracao das Folhas','2014-09-05'),
('Manutencao PCs','Manutencao PCs','2014-09-06'),
('Auditoria',NULL,'2014-09-07')

INSERT INTO user_has_projects
VALUES
(1,10001),
(5,10001),
(3,10003),
(4,10002),
(2,10002)


--SELECT * FROM projects
--SELECT * FROM users

UPDATE projects
SET data_proj = '2014-09-12'
WHERE id = 10002

--SELECT * FROM projects
UPDATE users
SET username = 'Rh_cido'
WHERE nome = 'Aparecido'

--SELECT * FROM users
UPDATE users
SET senha = '888@*'
WHERE username = 'Rh_maria' AND senha = '123mudar'
--SELECT * FROM USERS

DELETE user_has_projects
WHERE users_id = 2
--SELECT * FROM user_has_projects

ALTER TABLE projects
ADD budget DECIMAL(7,2) NULL

UPDATE projects
SET budget = 5750
WHERE id = 10001

UPDATE projects
SET budget = 7850
WHERE id = 10002

UPDATE projects
SET budget = 9530
WHERE id = 10003

--SELECT * FROM projects

SELECT username, senha FROM users WHERE nome = 'Ana'

SELECT nome, budget,
		CAST(budget * 1.25 AS DECIMAL(7,2)) AS valor_hipotetico
FROM projects

SELECT id, nome, email FROM users WHERE senha = '123mudar'

SELECT id, nome FROM projects WHERE budget BETWEEN 2000 AND 8000
