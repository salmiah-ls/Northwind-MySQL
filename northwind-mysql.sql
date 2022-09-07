SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `northwind` ;
CREATE SCHEMA IF NOT EXISTS `northwind` DEFAULT CHARACTER SET latin1 ;

USE `northwind` ;

-- -----------------------------------------------------
-- Table `northwind`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`customers` (
  `customer_id` CHAR(5) NOT NULL,
  `customer_name` VARCHAR(40) NOT NULL,
  `contact_name` VARCHAR(30),
  `contact_title` VARCHAR(30),
  `address` VARCHAR(60),
  `city` VARCHAR(15),
  `region` VARCHAR(15),
  `postal_code` VARCHAR(10),
  `country` VARCHAR(15),
  `phone` VARCHAR(24),
  `fax` VARCHAR(24),
  PRIMARY KEY (`customer_id`),
  INDEX `customer_id` (`customer_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`employees` (
  `employee_id` SMALLINT NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `title` VARCHAR(30),
  `title_of_courtesy` VARCHAR(25),
  `birth_date` DATE,
  `hire_date` DATE,
  `address` VARCHAR(60),
  `city` VARCHAR(15),
  `region` VARCHAR(15),
  `postal_code` VARCHAR(10),
  `country` VARCHAR(15),
  `home_phone` VARCHAR(25),
  `extension` VARCHAR(4),
  `photo` BLOB,
  `notes` LONGTEXT,
  `reports_to` SMALLINT,
  `photo_path` VARCHAR(255),
  PRIMARY KEY (`employee_id`),
  INDEX `employee_id` (`employee_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`suppliers` (
	`supplier_id` SMALLINT NOT NULL,
    `supplier_name` VARCHAR(40),
    `contact_name` VARCHAR(30),
    `contact_title` VARCHAR(30),
    `address` VARCHAR(60),
    `city` VARCHAR(15),
    `region` VARCHAR(15),
    `postal_code` VARCHAR(10),
    `country` VARCHAR(15),
    `phone` VARCHAR(25),
    `fax` VARCHAR(25),
    `homepage` LONGTEXT,
    PRIMARY KEY (`supplier_id`),
	INDEX `supplier_id` (`supplier_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`categories` (
	`category_id` SMALLINT NOT NULL,
    `category_name` VARCHAR(15) NOT NULL,
    `description` LONGTEXT,
    `picture` BLOB,
    PRIMARY KEY (`category_id`),
    INDEX `category_id` (`category_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`products` (
  `product_id` SMALLINT NOT NULL,
  `product_name` VARCHAR(40) NOT NULL,
  `supplier_id` SMALLINT,
  `category_id` SMALLINT,
  `quantity_per_unit` VARCHAR(20),
  `unit_price` FLOAT,
  `units_in_stock` SMALLINT,
  `units_on_order` SMALLINT,
  `reorder_level` SMALLINT,
  `discontinued` INTEGER NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `product_id` (`product_id` ASC),
CONSTRAINT `fk_products_categories`
	FOREIGN KEY (`category_id`)
    REFERENCES `northwind`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_products_suppliers`
	FOREIGN KEY (`supplier_id`)
    REFERENCES `northwind`.`suppliers` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`region` (
	`region_id` SMALLINT NOT NULL,
    `region_description` VARCHAR(15),
    PRIMARY KEY (`region_id`),
    INDEX `region_id`(`region_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`shippers` (
	`shipper_id` SMALLINT NOT NULL,
    `shipper_name` VARCHAR(40) NOT NULL,
    `phone` VARCHAR(24),
    PRIMARY KEY (`shipper_id`),
    INDEX `shipper_id` (`shipper_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
    
-- -----------------------------------------------------
-- Table `northwind`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`orders` (
	`order_id` SMALLINT NOT NULL,
    `customer_id` CHAR(5) NOT NULL,
    `employee_id` SMALLINT,
    `order_date` DATE,
    `required_date` DATE,
    `shipped_date` DATE,
    `shipper_id` SMALLINT,
    `freight` FLOAT,
    `ship_name` VARCHAR(40),
    `ship_address` VARCHAR(60),
    `ship_city` VARCHAR(15),
    `ship_region` VARCHAR(15),
    `ship_postal_code` VARCHAR(10),
    `ship_country` VARCHAR(15),
    PRIMARY KEY (`order_id`),
    INDEX `order_id` (`order_id` ASC),
CONSTRAINT `fk_orders_customers`
	FOREIGN KEY (`customer_id`)
    REFERENCES `northwind`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_orders_employees`
	FOREIGN KEY (`employee_id`)
    REFERENCES `northwind`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_orders_shippers`
	FOREIGN KEY (`shipper_id`)
    REFERENCES `northwind`.`shippers` (`shipper_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `northwind`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`order_details` (
	`order_id` SMALLINT NOT NULL,
    `product_id` SMALLINT NOT NULL,
    `unit_price` FLOAT NOT NULL,
    `quantity` SMALLINT NOT NULL,
    `discount` FLOAT NOT NULL,
    PRIMARY KEY (`order_id`, `product_id`),
    INDEX `order_id` (`order_id` ASC),
CONSTRAINT `fk_order_details_orders`
	FOREIGN KEY (`order_id`)
    REFERENCES `northwind`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_order_details_products`
	FOREIGN KEY (`product_id`)
    REFERENCES `northwind`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `northwind`.`us_states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`us_states` (
	`state_id` SMALLINT NOT NULL,
    `state_name` VARCHAR(100),
    `state_abbr` VARCHAR(2),
    `state_region` VARCHAR(50),
    PRIMARY KEY (`state_id`),
    INDEX `state_id` (`state_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `northwind`.`territories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`territories` (
	`territory_id` CHAR(5) NOT NULL,
    `territory_description` VARCHAR(20) NOT NULL,
    `region_id` SMALLINT NOT NULL,
    PRIMARY KEY (`territory_id`),
    INDEX `territory_id` (`territory_id` ASC),
CONSTRAINT `fk_territories_region`
	FOREIGN KEY (`region_id`)
    REFERENCES `northwind`.`region` (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `northwind`.`employee_territories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`employee_territories` (
	`employee_id` SMALLINT NOT NULL,
    `territory_id` CHAR(5) NOT NULL,
    PRIMARY KEY (`employee_id`, `territory_id`),
    INDEX `employee_id` (`employee_id` ASC),
CONSTRAINT `fk_employee_territories_employees`
	FOREIGN KEY (`employee_id`)
    REFERENCES `northwind`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_employee_territories_territories`
	FOREIGN KEY (`territory_id`)
    REFERENCES `northwind`.`territories` (`territory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;