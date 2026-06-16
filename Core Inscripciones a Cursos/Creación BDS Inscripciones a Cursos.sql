-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inscripcionesCursos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inscripcionesCursos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inscripcionesCursos` DEFAULT CHARACTER SET utf8 ;
USE `inscripcionesCursos` ;

-- -----------------------------------------------------
-- Table `inscripcionesCursos`.`estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inscripcionesCursos`.`estudiantes` (
  `id_estudiante` INT NOT NULL AUTO_INCREMENT,
  `nombre_estudiante` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  PRIMARY KEY (`id_estudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inscripcionesCursos`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inscripcionesCursos`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inscripcionesCursos`.`inscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inscripcionesCursos`.`inscripciones` (
  `id_curso` INT NOT NULL,
  `id_estudiante` INT NOT NULL,
  INDEX `fk_inscripciones_cursos_idx` (`id_curso` ASC) VISIBLE,
  INDEX `fk_inscripciones_estudiantes1_idx` (`id_estudiante` ASC) VISIBLE,
  PRIMARY KEY (`id_curso`, `id_estudiante`),
  CONSTRAINT `fk_inscripciones_cursos`
    FOREIGN KEY (`id_curso`)
    REFERENCES `inscripcionesCursos`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscripciones_estudiantes1`
    FOREIGN KEY (`id_estudiante`)
    REFERENCES `inscripcionesCursos`.`estudiantes` (`id_estudiante`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
