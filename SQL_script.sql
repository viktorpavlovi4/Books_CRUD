USE TEST;
DROP TABLE IF EXISTS book;
CREATE TABLE test.book (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `author` VARCHAR(100) NOT NULL,
  `isbn` VARCHAR(20) NOT NULL,
  `printYear` INT NOT NULL,
  `readAlready` BIT NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO book (`id`,`title`,`description`,`author`,`isbn`, `printYear`,`readAlready`) VALUES
  ('1', 'book1', 'description1', 'author1', 'isbn1', 1901, false),
  ('2', 'book2', 'description2', 'author2', 'isbn2', 1902, false),
  ('3', 'book3', 'description3', 'author3', 'isbn3', 1903, false),
  ('4', 'book4', 'description4', 'author4', 'isbn4', 1904, false),
  ('5', 'book5', 'description5', 'author5', 'isbn5', 1905, false),
  ('6', 'book6', 'description6', 'author6', 'isbn6', 1906, false),
  ('7', 'book7', 'description7', 'author7', 'isbn7', 1907, false),
  ('8', 'book8', 'description8', 'author8', 'isbn8', 1908, false),
  ('9', 'book9', 'description9', 'author9', 'isbn9', 1909, false),
  ('10', 'book10', 'description10', 'author10', 'isbn10', 1910, false),
  ('11', 'book11', 'description11', 'author11', 'isbn11', 1911, false),
  ('12', 'book12', 'description12', 'author12', 'isbn12', 1912, false),
  ('13', 'book13', 'description13', 'author13', 'isbn13', 1913, false),
  ('14', 'book14', 'description14', 'author14', 'isbn14', 1914, false),
  ('15', 'book15', 'description15', 'author15', 'isbn15', 1915, false),
  ('16', 'book16', 'description16', 'author16', 'isbn16', 1916, false),
  ('17', 'book17', 'description17', 'author17', 'isbn17', 1917, false),
  ('18', 'book18', 'description18', 'author18', 'isbn18', 2000, false),
  ('19', 'book19', 'description19', 'author19', 'isbn19', 2001, false),
  ('20', 'book20', 'description20', 'author20', 'isbn20', 2002, false),
  ('21', 'book21', 'description21', 'author21', 'isbn21', 2003, false),
  ('22', 'book22', 'description22', 'author22', 'isbn22', 2004, false),
  ('23', 'book23', 'description23', 'author23', 'isbn23', 2005, false),
  ('24', 'book24', 'description24', 'author24', 'isbn24', 2006, false),
  ('25', 'book25', 'description25', 'author25', 'isbn25', 2023, true)
;