--1.
CREATE DATABASE nauka04;
SOURCE E:\..\nauka04.sql;
USE nauka04;

--2.
 SELECT * FROM duzatabelka WHERE cena > 32765;

--3.
 SELECT * FROM duzatabelka WHERE cena BETWEEN 20000 AND 20010;

--4.

SELECT * FROM duzatabelka WHERE   cena BETWEEN 20000 AND 20010 ORDER BY kod ASC LIMIT 19, 10;

--5.
SELECT AVG(cena) FROM duzatabelka;

--6

SELECT * FROM duzatabelka WHERE cena>(SELECT AVG(cena) FROM duzatabelka) AND opis LIKE "%receitei%";

