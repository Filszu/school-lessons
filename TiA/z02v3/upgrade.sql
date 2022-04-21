--Filip Szumowski Autor

ALTER TABLE z02v3.ksiazki DROP FOREIGN KEY ksiazki;
ALTER TABLE `ksiazki` DROP `id_wypozyczajacego`;


--ALTER TABLE ksiazki DROP FOREIGN KEY ksiazki_ibfk_1;


CREATE TABLE `z02v3`.`wypozyczenia` ( `id_wyp` INT NOT NULL AUTO_INCREMENT ,
 `id_ksiazki` INT NOT NULL ,
 `id_wypozyczajacego` INT NOT NULL ,
  `	data_wypozyczenia` DATETIME NOT NULL ,
   `data_zwrotu` DATETIME NOT NULL ,
    PRIMARY KEY (`id_wyp`)) ENGINE = InnoDB;

ALTER TABLE `wypozyczenia` ADD FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki`(`Id_ksiazki`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `wypozyczenia` ADD FOREIGN KEY (`id_wypozyczajacego`) REFERENCES `uczniowie`(`id_ucznia`) ON DELETE RESTRICT ON UPDATE RESTRICT;


/*INSERT INTO wypozyczenia VALUES (NULL, 1, 1,1, '00-00-0000 00:00:00'),
(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00'),(NULL, 2, 3,1, '10-10-2031 10:00:00')
;*/

INSERT INTO wypozyczenia VALUES (NULL, '3', '1', '2021-03-08 13:55:16', '2021-03-18 13:55:16'),
(NULL, '2', '1', '2021-03-08 13:55:16', '2021-03-18 13:55:16');


INSERT INTO wypozyczenia  VALUES (NULL, '3', '1', '2021-03-11 13:58:01', '2021-03-26 13:58:01'), (NULL, '2', '2', '2021-03-17 13:58:01', '2021-03-19 13:58:01');

INSERT INTO wypozyczenia VALUES (NULL, '3', '1', '2021-03-08 13:55:16', '2021-03-18 13:55:16'),
(NULL, '2', '1', '2021-03-08 13:55:16', '2021-03-18 13:55:16'), (NULL, '2', '1', '2021-03-08 13:55:16', '2021-03-18 13:55:16'), (NULL, 3, 1, '2021-03-08 13:55:16', '2021-03-18 13:55:16'), (NULL, 2, 2, '2021-03-08 13:55:16', '2021-03-18 13:55:16'), (NULL, 2, 1, '2021-03-08 13:55:16', '2021-03-18 13:55:16');




