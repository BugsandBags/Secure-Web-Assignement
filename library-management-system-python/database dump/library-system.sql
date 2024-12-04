-- SQL Dump for `library-system` Database

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Set character set
/*!40101 SET NAMES utf8mb4 */;

-- ========================================================
-- Table: `author`
-- ========================================================
CREATE TABLE `author` (
    `authorid` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
    `status` ENUM('Enable', 'Disable') COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `author` (`authorid`, `name`, `status`) VALUES
(2, 'Alan Forbes', 'Enable'),
(3, 'Lynn Beighley', 'Enable');

-- ========================================================
-- Table: `book`
-- ========================================================
CREATE TABLE `book` (
    `bookid` INT(11) NOT NULL AUTO_INCREMENT,
    `categoryid` INT(11) NOT NULL,
    `authorid` INT(11) NOT NULL,
    `rackid` INT(11) NOT NULL,
    `name` TEXT COLLATE utf8_unicode_ci NOT NULL,
    `picture` VARCHAR(250) COLLATE utf8_unicode_ci NOT NULL,
    `publisherid` INT(11) NOT NULL,
    `isbn` VARCHAR(30) COLLATE utf8_unicode_ci NOT NULL,
    `no_of_copy` INT(5) NOT NULL,
    `status` ENUM('Enable', 'Disable') COLLATE utf8_unicode_ci NOT NULL,
    `added_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `book` (`bookid`, `categoryid`, `authorid`, `rackid`, `name`, `picture`, `publisherid`, `isbn`, `no_of_copy`, `status`, `added_on`, `updated_on`) VALUES
(1, 2, 2, 2, 'The Joy of PHP Programming', 'joy-php.jpg', 8, 'B00BALXN70', 10, 'Enable', '2022-06-12 11:12:48', '2022-06-12 11:13:27'),
(2, 2, 3, 2, 'Head First PHP & MySQL', 'header-first-php.jpg', 9, '0596006306', 10, 'Enable', '2022-06-12 11:16:01', '2022-06-12 11:16:01');

-- ========================================================
-- Table: `category`
-- ========================================================
CREATE TABLE `category` (
    `categoryid` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
    `status` ENUM('Enable', 'Disable') COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `category` (`categoryid`, `name`, `status`) VALUES
(1, 'Web Design', 'Enable'),
(2, 'Programming', 'Enable');

-- ========================================================
-- Table: `issued_book`
-- ========================================================
CREATE TABLE `issued_book` (
    `issuebookid` INT(11) NOT NULL AUTO_INCREMENT,
    `bookid` INT(11) NOT NULL,
    `userid` INT(11) NOT NULL,
    `issue_date_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `expected_return_date` DATETIME NOT NULL,
    `return_date_time` DATETIME NOT NULL,
    `status` ENUM('Issued', 'Returned', 'Not Return') COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`issuebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `issued_book` (`issuebookid`, `bookid`, `userid`, `issue_date_time`, `expected_return_date`, `return_date_time`, `status`) VALUES
(1, 2, 2, '2022-06-12 15:33:45', '2022-06-15 16:27:59', '2022-06-16 16:27:59', 'Not Return');

-- ========================================================
-- Table: `publisher`
-- ========================================================
CREATE TABLE `publisher` (
    `publisherid` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `status` ENUM('Enable', 'Disable') NOT NULL,
    PRIMARY KEY (`publisherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `publisher` (`publisherid`, `name`, `status`) VALUES
(2, 'Amazon publishing', 'Enable'),
(3, 'Penguin books ltd.', 'Enable');

-- ========================================================
-- Table: `rack`
-- ========================================================
CREATE TABLE `rack` (
    `rackid` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
    `status` ENUM('Enable', 'Disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Enable',
    PRIMARY KEY (`rackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rack` (`rackid`, `name`, `status`) VALUES
(1, 'R1', 'Enable'),
(2, 'R2', 'Enable');

-- ========================================================
-- Table: `user`
-- ========================================================
CREATE TABLE `user` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) DEFAULT NULL,
    `last_name` VARCHAR(255) DEFAULT NULL,
    `email` VARCHAR(255) DEFAULT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` ENUM('admin', 'user') DEFAULT 'admin',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `role`) VALUES
('Mark', 'Wood', 'mark@webdamn.com', '123', 'user'),
('George', 'Smith', 'george@webdamn.com', '123', 'admin');

COMMIT;
