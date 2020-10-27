-- MySQL Workbench Synchronization
-- Generated: 2020-01-15 22:03
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Goc

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `kafić`.`Stavka` 
DROP FOREIGN KEY `V_Normativ`,
DROP FOREIGN KEY `V_Podstavka`;

ALTER TABLE `kafić`.`Račun` 
DROP FOREIGN KEY `V_Konobar`,
DROP FOREIGN KEY `V_Način_plaćanja`;

ALTER TABLE `kafić`.`Stavka_računa` 
DROP FOREIGN KEY `V_Artikl`;

ALTER TABLE `kafić`.`Konobar` 
CHANGE COLUMN `Datum_rodenja` `Datum_rodenja` DATE NULL DEFAULT NULL ;

ALTER TABLE `kafić`.`Postavka` 
DROP FOREIGN KEY `V_Sastojak`;

ALTER TABLE `kafić`.`Postavka` ADD CONSTRAINT `V_Sastojak`
  FOREIGN KEY (`V_Sastojak`)
  REFERENCES `kafić`.`Sastojak` (`idSastojak`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `kafić`.`Stavka` 
ADD CONSTRAINT `V_Normativ`
  FOREIGN KEY (`V_Normativ`)
  REFERENCES `kafić`.`Normativ` (`idNormativ`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `V_Podstavka`
  FOREIGN KEY (`V_Podstavka`)
  REFERENCES `kafić`.`Postavka` (`idPostavka`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `kafić`.`Račun` 
DROP FOREIGN KEY `V_Stol`;

ALTER TABLE `kafić`.`Račun` ADD CONSTRAINT `V_Konobar`
  FOREIGN KEY (`Konobar`)
  REFERENCES `kafić`.`Konobar` (`idKonobar`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `V_Stol`
  FOREIGN KEY (`Stol`)
  REFERENCES `kafić`.`Stol` (`idStol`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `V_Način_plaćanja`
  FOREIGN KEY (`Način_plaćanja`)
  REFERENCES `kafić`.`Način_plaćanja` (`idNačin_plaćanja`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `kafić`.`Stavka_računa` 
DROP FOREIGN KEY `V_Račun`;

ALTER TABLE `kafić`.`Stavka_računa` ADD CONSTRAINT `V_Račun`
  FOREIGN KEY (`Račun`)
  REFERENCES `kafić`.`Račun` (`idRačun`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `V_Artikl`
  FOREIGN KEY (`Artikl`)
  REFERENCES `kafić`.`Artikl` (`idArtikl`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


DELIMITER $$

USE `kafić`$$
CREATE DEFINER = CURRENT_USER TRIGGER `kafić`.`Račun_AFTER_INSERT` AFTER INSERT ON `Račun` FOR EACH ROW
BEGIN
Insert into Povijest_transakcija (Vrijeme,Konobar,Stol,Način_plaćanja,Ukupna_cijena) 
values (new.Vrijeme,new.Konobar,new.Stol,new.Način_plaćanja,new.Ukupna_cijena);
END$$

USE `kafić`$$
DROP TRIGGER IF EXISTS `kafić`.`Povijest_transakcija_AFTER_INSERT` $$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
