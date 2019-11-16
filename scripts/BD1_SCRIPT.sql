-- MySQL Script generated by MySQL Workbench
-- Thu Nov  7 12:48:00 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDI-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BDI-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDI-db` DEFAULT CHARACTER SET utf8 ;
USE `BDI-db` ;

-- -----------------------------------------------------
-- Table `BDI-db`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Cliente` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Brinquedos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Brinquedos` (
  `Cod_brinquedo` INT NOT NULL,
  `Preco` INT(10) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_brinquedo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Funcionario` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Funcionario_Brinquedos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Funcionario_Brinquedos` (
  `Funcionario_CPF` INT NOT NULL,
  `Brinquedos_Cod_brinquedo` INT NOT NULL,
  PRIMARY KEY (`Funcionario_CPF`, `Brinquedos_Cod_brinquedo`),
  INDEX `fk_Funcionario_has_Brinquedos_Brinquedos1_idx` (`Brinquedos_Cod_brinquedo` ASC),
  INDEX `fk_Funcionario_has_Brinquedos_Funcionario1_idx` (`Funcionario_CPF` ASC),
  CONSTRAINT `fk_Funcionario_has_Brinquedos_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `BDI-db`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_has_Brinquedos_Brinquedos1`
    FOREIGN KEY (`Brinquedos_Cod_brinquedo`)
    REFERENCES `BDI-db`.`Brinquedos` (`Cod_brinquedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Cartao_cobranca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Cartao_cobranca` (
  `Data` DATE NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`Data`, `Cliente_CPF`),
  INDEX `fk_Cartao_cobranca_Cliente1_idx` (`Cliente_CPF` ASC),
  CONSTRAINT `fk_Cartao_cobranca_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `BDI-db`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Cartao_cobranca_brinquedos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Cartao_cobranca_brinquedos` (
  `Cartao_cobranca_Data` DATE NOT NULL,
  `Cartao_cobranca_Cliente_CPF` INT NOT NULL,
  `Brinquedos_Cod_brinquedo` INT NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`Cartao_cobranca_Data`, `Cartao_cobranca_Cliente_CPF`, `Brinquedos_Cod_brinquedo`, `Hora`),
  INDEX `fk_Cartao_cobranca_has_Brinquedos_Brinquedos1_idx` (`Brinquedos_Cod_brinquedo` ASC),
  INDEX `fk_Cartao_cobranca_has_Brinquedos_Cartao_cobranca1_idx` (`Cartao_cobranca_Data` ASC, `Cartao_cobranca_Cliente_CPF` ASC),
  CONSTRAINT `fk_Cartao_cobranca_has_Brinquedos_Cartao_cobranca1`
    FOREIGN KEY (`Cartao_cobranca_Data` , `Cartao_cobranca_Cliente_CPF`)
    REFERENCES `BDI-db`.`Cartao_cobranca` (`Data` , `Cliente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cartao_cobranca_has_Brinquedos_Brinquedos1`
    FOREIGN KEY (`Brinquedos_Cod_brinquedo`)
    REFERENCES `BDI-db`.`Brinquedos` (`Cod_brinquedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Telefones_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Telefones_funcionario` (
  `Telefone` INT NOT NULL,
  `Funcionario_CPF` INT NOT NULL,
  PRIMARY KEY (`Telefone`, `Funcionario_CPF`),
  INDEX `fk_Telefones_funcionario_Funcionario1_idx` (`Funcionario_CPF` ASC),
  CONSTRAINT `fk_Telefones_funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `BDI-db`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDI-db`.`Telefones_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDI-db`.`Telefones_cliente` (
  `Telefone` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`Telefone`, `Cliente_CPF`),
  INDEX `fk_Telefones-cliente_Cliente1_idx` (`Cliente_CPF` ASC),
  CONSTRAINT `fk_Telefones-cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `BDI-db`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;