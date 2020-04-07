-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema brasil
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `brasil` ;

-- -----------------------------------------------------
-- Schema brasil
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `brasil` DEFAULT CHARACTER SET utf8 ;
USE `brasil` ;

-- -----------------------------------------------------
-- Table `brasil`.`Regiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brasil`.`Regiao` ;

CREATE TABLE IF NOT EXISTS `brasil`.`Regiao` (
  `id_regiao` INT NOT NULL AUTO_INCREMENT,
  `nome_regiao` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_regiao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brasil`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brasil`.`Estado` ;

CREATE TABLE IF NOT EXISTS `brasil`.`Estado` (
  `uf` CHAR(2) NOT NULL,
  `id_regiao` INT NOT NULL,
  `nome_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uf`),
  INDEX `fk_Estado_Regiao_idx` (`id_regiao` ASC) VISIBLE,
  CONSTRAINT `fk_Estado_Regiao`
    FOREIGN KEY (`id_regiao`)
    REFERENCES `brasil`.`Regiao` (`id_regiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `brasil`.`Regiao`
-- -----------------------------------------------------
START TRANSACTION;
USE `brasil`;
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (1, 'Norte');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (2, 'Nordeste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (3, 'Centro-Oeste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (4, 'Sudeste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (5, 'Sul');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (6, 'Leste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (7, 'Oeste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (8, 'Sudoeste');
INSERT INTO `brasil`.`Regiao` (`id_regiao`, `nome_regiao`) VALUES (9, 'Noroeste');

COMMIT;


-- -----------------------------------------------------
-- Data for table `brasil`.`Estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `brasil`;
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('RO', 1, 'Rondônia');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('AC', 1, 'Acre ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('AM', 1, 'Amazonas');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('RR', 1, 'Roraima ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('PA', 1, 'Pará ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('AP', 1, 'Amapá ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('TO', 1, 'Tocantins ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('MA', 2, 'Maranhão ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('PI', 2, 'Piauí');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('CE', 2, 'Ceará ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('RN', 2, 'Rio Grande do Norte ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('PB', 2, 'Paraíba ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('PE', 2, 'Pernambuco ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('AL', 2, 'Alagoas ');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('SE', 2, 'Sergipe');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('BA', 2, 'Bahia');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('MG', 4, 'Minas Gerais');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('ES', 4, 'Espírito Santo');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('RJ', 4, 'Rio de Janeiro');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('SP', 4, 'São Paulo');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('PR', 5, 'Paraná');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('SC', 5, 'Santa Catarina');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('RS', 5, 'Rio Grande do Sul');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('MS', 3, 'Mato Grosso do Sul');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('MT', 3, 'Mato Grosso');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('GO', 3, 'Goiás');
INSERT INTO `brasil`.`Estado` (`uf`, `id_regiao`, `nome_estado`) VALUES ('DF', 3, 'Distrito Federal');

COMMIT;