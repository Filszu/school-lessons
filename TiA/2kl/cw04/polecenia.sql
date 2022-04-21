-- 3
ALTER TABLE `uczen` ADD `id_ucznia` VARCHAR(30) NOT NULL AFTER `klasa`;
ALTER TABLE `uczen` ADD PRIMARY KEY(`id_ucznia`);
ALTER TABLE `uczen` CHANGE `id_ucznia` `id_ucznia` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL AUTO_INCREMENT;


-- 5
SELECT nazwisko FROM uczen ORDER BY nazwisko
SELECT nazwisko FROM uczen WHERE nazwisko LIKE "N%A" ORDER BY nazwisko

-- 6
SELECT * FROM uczen

SELECT avg(ocena) FROM oceny


-- SELECT u.imie, u.nazwisko, o.ocena, p.nazwa_przedmiotu FROM uczen AS u, oceny AS o, przedmiot AS p WHERE o.ocena = 1 AND p.id_przedmiotu=3 AND u.id_ucznia=o.id_ucznia AND o.id_przedmiotu=p.id_przedmiotu

SELECT u.imie, u.nazwisko, o.ocena, p.nazwa_przedmiotu FROM uczen AS u, oceny AS o, przedmiot AS p 
WHERE 
o.ocena = (SELECT MIN(ocena) FROM oceny)
AND p.id_przedmiotu=3
AND u.id_ucznia=o.id_ucznia AND o.id_przedmiotu=p.id_przedmiotu

SELECT concat(imie, " ",nazwisko) AS "Imię i nazwisko", nazwa_przedmiotu as "przedmiot", ocena FROM uczen, oceny, przedmiot WHERE oceny.id_ucznia = uczen.id_ucznia limit 1



