-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema miporfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miporfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miporfolio` ;
USE `miporfolio` ;

-- -----------------------------------------------------
-- Table `miporfolio`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`provincia` (
  `id` INT NOT NULL,
  `nombre_provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`persona` (
  `id` INT NOT NULL,
  `nombreyapellido` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `especialidad1` VARCHAR(45) NULL,
  `especialidad2` VARCHAR(45) NULL,
  `especialidad3` VARCHAR(45) NULL,
  `facebook` VARCHAR(100) NULL,
  `linkedin` VARCHAR(100) NULL,
  `instagram` VARCHAR(100) NULL,
  `telefono` INT NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `link_foto_portada` VARCHAR(100) NULL,
  `link_abatar` VARCHAR(100) NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_persona_provincia_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_persona_provincia`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `miporfolio`.`provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`experiencia` (
  `id` INT NOT NULL,
  `lugar_trabajo` VARCHAR(45) NOT NULL,
  `desc_trabajo` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `desde` DATE NOT NULL,
  `hasta` DATE NOT NULL,
  `link_sitio_trabajo` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miporfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`usuario` (
  `id` INT NOT NULL,
  `login` VARCHAR(10) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miporfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`educacion` (
  `id` INT NOT NULL,
  `imagen_educa` VARCHAR(45) NULL,
  `titulo_educa` VARCHAR(45) NULL,
  `descripcion_educa` VARCHAR(45) NULL,
  `descripcio_link` VARCHAR(45) NULL,
  `link_casa_educa` VARCHAR(100) NULL,
  `link_certificado` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miporfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`proyectos_realizados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`proyectos_realizados` (
  `id` INT NOT NULL,
  `link_foto_demo` VARCHAR(100) NULL,
  `titulo_proyecto` VARCHAR(45) NULL,
  `desc_proyecto` VARCHAR(250) NULL,
  `link_proyecto` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyectos_realizados_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_realizados_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miporfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miporfolio`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miporfolio`.`habilidades` (
  `id` INT NOT NULL,
  `nombre_habilidad` VARCHAR(45) NOT NULL,
  `porcenta_habil` INT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_habilidades_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miporfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
