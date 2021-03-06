CREATE TABLE Projects (
	pid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cid INT UNSIGNED,
	title VARCHAR(100),
	status INT,
	startDate DATE,
	endDate DATE,
	buildingName VARCHAR(100),
	address VARCHAR(100),
	zip VARCHAR(6),
	type int,
	summary TEXT,
	results TEXT,
	link VARCHAR(200),
	pic VARCHAR(200),
	conid INT UNSIGNED,
	fundedBy VARCHAR(100),
	keywords VARCHAR(100),
	stemmedSearchText TEXT,
	visible BOOLEAN NOT NULL DEFAULT FALSE,
	lat REAL,
	lng REAL,
	FULLTEXT(stemmedSearchText)
) ENGINE=MyISAM;

CREATE TABLE History (
	hid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	time DATETIME NOT NULL DEFAULT '2016-06-01 00:00:00',
	deleted DATETIME NOT NULL DEFAULT '3000-01-01 00:00:00',
	editedBy INT UNSIGNED,
	pid INT UNSIGNED,
	cid INT UNSIGNED,
	title VARCHAR(100),
	status INT,
	startDate DATE,
	endDate DATE,
	buildingName VARCHAR(100),
	address VARCHAR(100),
	zip VARCHAR(6),
	type int,
	summary TEXT,
	results TEXT,
	link VARCHAR(200),
	pic VARCHAR(200),
	conid INT UNSIGNED,
	fundedBy VARCHAR(100),
	keywords VARCHAR(200),
	stemmedSearchText TEXT,
	visible BOOLEAN NOT NULL DEFAULT FALSE,
	lat REAL,
	lng REAL
);

CREATE TABLE Centers (
	cid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
	acronym VARCHAR(8),
	color CHAR(7)
);

CREATE TABLE Contacts (
	conid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(16)
);

CREATE TABLE Users (
	uid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(100),
	firstName VARCHAR(100),
	lastName VARCHAR(100),
	phone VARCHAR(16),
	password VARCHAR(64),
	authenticated BOOLEAN NOT NULL DEFAULT FALSE,
	root BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TRIGGER `defaultTime` BEFORE INSERT ON  `History` 
FOR EACH ROW 
SET NEW.time = NOW();