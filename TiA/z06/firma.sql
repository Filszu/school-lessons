
CREATE TABLE `z06`.`dostawcy` ( `id_dostawcy` INT NOT NULL AUTO_INCREMENT , `adres` VARCHAR(60) NOT NULL , `telefon` INT(11) NOT NULL , PRIMARY KEY (`id_dostawcy`)) ENGINE = InnoDB;


CREATE TABLE `z06`.`towary` ( `id_towaru` INT NOT NULL AUTO_INCREMENT , `id_dostawcy` INT NOT NULL , `nazwa` VARCHAR(60) NOT NULL , `cena` DECIMAL(9,2) NOT NULL , PRIMARY KEY (`id_towaru`)) ENGINE = InnoDB;



CREATE TABLE `z06`.`magazyn` ( `id_towaru` INT NOT NULL , `liczba_sztuk` SMALLINT NOT NULL DEFAULT '0' ) ENGINE = InnoDB;

ALTER TABLE `towary` ADD FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy`(`id_dostawcy`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `magazyn` ADD FOREIGN KEY (`id_towaru`) REFERENCES `towary`(`id_towaru`) ON DELETE RESTRICT ON UPDATE RESTRICT;