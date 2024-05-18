-- Criar a tabela Produtos
CREATE DATABASE Produtos;
USE Produtos;
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecível BOOLEAN NOT NULL,
    marca VARCHAR(50),
    nacionalidade VARCHAR(50)
);

-- Inserir seis produtos
INSERT INTO Produtos (id_produto, nome, preço, estoque, perecível, marca, nacionalidade) VALUES
(1, 'Arroz', 5.99, 100, false, 'Tio João', 'Brasil'),
(2, 'Feijão', 4.50, 80, false, 'Camil', 'Brasil'),
(3, 'Leite', 3.50, 50, true, 'Nestlé', 'Brasil'),
(4, 'Sabão em Pó', 8.99, 60, false, 'Omo', 'Brasil'),
(5, 'Chocolate', 4.99, 35, true, 'Milka', 'Suíça');  

SELECT * FROM Produtos;
-- Quantidade de produtos cadastrados
SELECT COUNT(*) AS total_produtos FROM Produtos;
-- Preço médio dos produtos
SELECT AVG(preço) AS preço_médio FROM Produtos;
-- Média dos preços dos produtos em grupos perecíveis e não perecíveis
SELECT perecível, AVG(preço) AS preço_médio FROM Produtos GROUP BY perecível;
-- Média dos preços dos produtos agrupados pelo nome do produto
SELECT nome, AVG(preço) AS preço_médio FROM Produtos GROUP BY nome;
-- Média dos preços e total em estoque dos produtos
SELECT AVG(preço) AS preço_médio, SUM(estoque) AS total_em_estoque FROM Produtos;
-- Nome, marca e quantidade em estoque do produto mais caro
SELECT nome, marca, estoque FROM Produtos WHERE preço = (SELECT MAX(preço) FROM Produtos);
-- Produtos com preço acima da média
SELECT * FROM Produtos WHERE preço > (SELECT AVG(preço) FROM Produtos);
-- Quantidade de produtos de cada nacionalidade
SELECT nacionalidade, COUNT(*) AS quantidade FROM Produtos GROUP BY nacionalidade;