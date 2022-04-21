--Filip Szumowski 1td
/* Ad 

─────▄───▄
─▄█▄─█▀█▀█─▄█▄
▀▀████▄█▄████▀▀  ------------------- 
─────▀█▀█▀

Oficjalny patroni: www.ciac.ml, filszu.ct8.pl

*/


 ALTER TABLE students CHANGE country kraj VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Polska';
 


RENAME TABLE students TO studenci;

--ALTER TABLE studenci CHANGE COLUMN student_id id_studenta varchar(64);
ALTER TABLE studenci CHANGE COLUMN id_studenta id_studenta int(7);
ALTER TABLE studenci CHANGE COLUMN family_name nazwisko varchar(50);
ALTER TABLE studenci CHANGE COLUMN name imie varchar(30);


ALTER TABLE studenci CHANGE id_studenta id_studenta INT(7) NOT NULL AUTO_INCREMENT;


--dodatkowe
INSERT INTO studenci VALUES (NULL, 'Szumowski', 'Filip', 'Polska'),
(NULL, 'Skrzypiec', 'Adam', NULL),
(NULL, 'Martynowicz', 'Kasia', NULL);

