-- -mysql -u root -p

-- create database nauka04

-- use nauka 04

SOURCE nauka04.sql

SELECT * FROM duzatabelka WHERE cena>32765


SELECT * FROM duzatabelka WHERE cena BETWEEN 20000 AND 20010 ORDER by kod ASC

SELECT * FROM duzatabelka WHERE cena BETWEEN 20000 AND 20010 ORDER by kod ASC LIMIT 20,10

SELECT AVG(cena) AS AveragePrice FROM duzatabelka;

SELECT * FROM duzatabelka WHERE opis LIKE "%receitei%" AND cena >=(AVG(cena) AS AveragePrice FROM duzatabelka) 