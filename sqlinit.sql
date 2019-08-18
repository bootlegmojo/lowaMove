-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema iowa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema iowa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iowa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `iowa` ;

-- -----------------------------------------------------
-- Table `iowa`.`iowausers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iowa`.`iowausers` (
  `user_ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `second_name` VARCHAR(45) NULL,
  `company` VARCHAR(45) NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE INDEX `user_ID_UNIQUE` (`user_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `iowa`.`iowadata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iowa`.`iowadata` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `MSSubClass` INT(11) NULL DEFAULT NULL,
  `MSZoning` TEXT NULL DEFAULT NULL,
  `LotArea` INT(11) NULL DEFAULT NULL,
  `Street` TEXT NULL DEFAULT NULL,
  `Alley` TEXT NULL DEFAULT NULL,
  `LotShape` TEXT NULL DEFAULT NULL,
  `LandContour` TEXT NULL DEFAULT NULL,
  `Utilities` TEXT NULL DEFAULT NULL,
  `LotConfig` TEXT NULL DEFAULT NULL,
  `LandSlope` TEXT NULL DEFAULT NULL,
  `Neighborhood` TEXT NULL DEFAULT NULL,
  `Condition1` TEXT NULL DEFAULT NULL,
  `Condition2` TEXT NULL DEFAULT NULL,
  `BldgType` TEXT NULL DEFAULT NULL,
  `HouseStyle` TEXT NULL DEFAULT NULL,
  `OverallQual` INT(11) NULL DEFAULT NULL,
  `OverallCond` INT(11) NULL DEFAULT NULL,
  `YearBuilt` INT(11) NULL DEFAULT NULL,
  `YearRemodAdd` INT(11) NULL DEFAULT NULL,
  `RoofStyle` TEXT NULL DEFAULT NULL,
  `RoofMatl` TEXT NULL DEFAULT NULL,
  `Exterior1st` TEXT NULL DEFAULT NULL,
  `Exterior2nd` TEXT NULL DEFAULT NULL,
  `MasVnrType` TEXT NULL DEFAULT NULL,
  `MasVnrArea` INT(11) NULL DEFAULT NULL,
  `ExterQual` TEXT NULL DEFAULT NULL,
  `ExterCond` TEXT NULL DEFAULT NULL,
  `Foundation` TEXT NULL DEFAULT NULL,
  `BsmtQual` TEXT NULL DEFAULT NULL,
  `BsmtCond` TEXT NULL DEFAULT NULL,
  `BsmtExposure` TEXT NULL DEFAULT NULL,
  `BsmtFinType1` TEXT NULL DEFAULT NULL,
  `BsmtFinSF1` INT(11) NULL DEFAULT NULL,
  `BsmtFinType2` TEXT NULL DEFAULT NULL,
  `BsmtFinSF2` INT(11) NULL DEFAULT NULL,
  `BsmtUnfSF` INT(11) NULL DEFAULT NULL,
  `TotalBsmtSF` INT(11) NULL DEFAULT NULL,
  `Heating` TEXT NULL DEFAULT NULL,
  `HeatingQC` TEXT NULL DEFAULT NULL,
  `CentralAir` TEXT NULL DEFAULT NULL,
  `Electrical` TEXT NULL DEFAULT NULL,
  `X1stFlrSF` INT(11) NULL DEFAULT NULL,
  `X2ndFlrSF` INT(11) NULL DEFAULT NULL,
  `LowQualFinSF` INT(11) NULL DEFAULT NULL,
  `GrLivArea` INT(11) NULL DEFAULT NULL,
  `BsmtFullBath` INT(11) NULL DEFAULT NULL,
  `BsmtHalfBath` INT(11) NULL DEFAULT NULL,
  `FullBath` INT(11) NULL DEFAULT NULL,
  `HalfBath` INT(11) NULL DEFAULT NULL,
  `BedroomAbvGr` INT(11) NULL DEFAULT NULL,
  `KitchenAbvGr` INT(11) NULL DEFAULT NULL,
  `KitchenQual` TEXT NULL DEFAULT NULL,
  `TotRmsAbvGrd` INT(11) NULL DEFAULT NULL,
  `Functional` TEXT NULL DEFAULT NULL,
  `Fireplaces` INT(11) NULL DEFAULT NULL,
  `FireplaceQu` TEXT NULL DEFAULT NULL,
  `GarageType` TEXT NULL DEFAULT NULL,
  `GarageYrBlt` INT(11) NULL DEFAULT NULL,
  `GarageFinish` TEXT NULL DEFAULT NULL,
  `GarageCars` INT(11) NULL DEFAULT NULL,
  `GarageArea` INT(11) NULL DEFAULT NULL,
  `GarageQual` TEXT NULL DEFAULT NULL,
  `GarageCond` TEXT NULL DEFAULT NULL,
  `PavedDrive` TEXT NULL DEFAULT NULL,
  `WoodDeckSF` INT(11) NULL DEFAULT NULL,
  `OpenPorchSF` INT(11) NULL DEFAULT NULL,
  `EnclosedPorch` INT(11) NULL DEFAULT NULL,
  `X3SsnPorch` INT(11) NULL DEFAULT NULL,
  `ScreenPorch` INT(11) NULL DEFAULT NULL,
  `PoolArea` INT(11) NULL DEFAULT NULL,
  `PoolQC` TEXT NULL DEFAULT NULL,
  `Fence` TEXT NULL DEFAULT NULL,
  `MiscFeature` TEXT NULL DEFAULT NULL,
  `MiscVal` INT(11) NULL DEFAULT NULL,
  `MoSold` INT(11) NULL DEFAULT NULL,
  `YrSold` INT(11) NULL DEFAULT NULL,
  `SaleType` TEXT NULL DEFAULT NULL,
  `SaleCondition` TEXT NULL DEFAULT NULL,
  `SalePrice` INT(11) NULL DEFAULT NULL,
  `toilets` INT(11) NULL DEFAULT NULL,
  `YearsSinceRemodel` INT(11) NULL DEFAULT NULL,
  `iowausers_user_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_iowadata_iowausers_idx` (`iowausers_user_ID` ASC) VISIBLE,
  CONSTRAINT `fk_iowadata_iowausers`
    FOREIGN KEY (`iowausers_user_ID`)
    REFERENCES `iowa`.`iowausers` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
