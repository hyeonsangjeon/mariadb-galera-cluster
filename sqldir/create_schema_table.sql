CREATE SCHEMA IF NOT EXISTS `MODEL` DEFAULT CHARACTER SET utf8 ;
USE `MODEL` ;

-- -----------------------------------------------------
-- Table `MODEL`.`API`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODEL`.`API` (
  `seq_no` INT(100) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `rank` int(5) DEFAULT NULL,
  PRIMARY KEY (`seq_no`))
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



INSERT INTO `API` (`id`, `name`, `symbol`, `rank`)
VALUES
    ('ethereum','Ethereum','ETH', 2),
    ('ripple','XRP','XRP', 3),
    ('stellar','Stellar','XLM', 9);


