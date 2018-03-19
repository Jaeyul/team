SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS room_info;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS expose;
DROP TABLE IF EXISTS Friends;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS regeon;
DROP TABLE IF EXISTS user_profile;
DROP TABLE IF EXISTS user_info;




/* Create Tables */

CREATE TABLE category
(
	categoryNo int NOT NULL AUTO_INCREMENT,
	categoryName varchar(30) NOT NULL,
	PRIMARY KEY (categoryNo),
	UNIQUE (categoryName)
);


CREATE TABLE expose
(
	eiNo int(15) unsigned zerofill NOT NULL AUTO_INCREMENT,
	eiRegDate datetime NOT NULL,
	eiMassege varchar(500) NOT NULL,
	uiNo int unsigned NOT NULL,
	targetUiNo int unsigned NOT NULL,
	PRIMARY KEY (eiNo),
	UNIQUE (eiRegDate),
	UNIQUE (eiMassege)
);


CREATE TABLE Friends
(
	FNo int unsigned NOT NULL AUTO_INCREMENT,
	FName varchar(30) NOT NULL,
	FId varchar(30) NOT NULL,
	uiNo int unsigned NOT NULL,
	PRIMARY KEY (FNo)
);


CREATE TABLE menu
(
	mNo tinyint NOT NULL AUTO_INCREMENT,
	mUrl varchar(100) NOT NULL,
	mName varchar(50) NOT NULL,
	mDesc varchar(100),
	PRIMARY KEY (mNo),
	UNIQUE (mUrl),
	UNIQUE (mName)
);


CREATE TABLE note
(
	noteNo int unsigned NOT NULL AUTO_INCREMENT,
	noteText text NOT NULL,
	noteServerName varchar(100) NOT NULL,
	noteOriginName varchar(100) NOT NULL,
	targetUiNo int unsigned NOT NULL,
	uiNo int unsigned NOT NULL,
	noteRegDate datetime NOT NULL,
	PRIMARY KEY (noteNo)
);


CREATE TABLE regeon
(
	regeonNo int NOT NULL AUTO_INCREMENT,
	regeonName varchar(30) NOT NULL,
	PRIMARY KEY (regeonNo),
	UNIQUE (regeonName)
);


CREATE TABLE room_info
(
	rNo int unsigned NOT NULL AUTO_INCREMENT,
	rName varchar(50) NOT NULL,
	rSize tinyint unsigned NOT NULL,
	rTag varchar(100),
	rRegDate datetime,
	categoryNo int NOT NULL,
	regeonNo int NOT NULL,
	PRIMARY KEY (rNo),
	UNIQUE (rName)
);


CREATE TABLE user_info
(
	uiNo int unsigned NOT NULL AUTO_INCREMENT,
	uiId varchar(30) NOT NULL,
	uiPwd varchar(100) NOT NULL,
	uiNickName varchar(100),
	uiEmail varchar(300),
	uiRegDate datetime NOT NULL,
	PRIMARY KEY (uiNo),
	UNIQUE (uiId)
);


CREATE TABLE user_profile
(
	ufNo int(15) unsigned NOT NULL AUTO_INCREMENT,
	ufName varchar(10),
	ufAge int(3) unsigned,
	ufGender tinyint,
	uiNo int unsigned NOT NULL,
	PRIMARY KEY (ufNo)
);



/* Create Foreign Keys */

ALTER TABLE room_info
	ADD FOREIGN KEY (categoryNo)
	REFERENCES category (categoryNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room_info
	ADD FOREIGN KEY (regeonNo)
	REFERENCES regeon (regeonNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE expose
	ADD FOREIGN KEY (targetUiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE expose
	ADD FOREIGN KEY (uiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Friends
	ADD FOREIGN KEY (uiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE note
	ADD FOREIGN KEY (targetUiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE note
	ADD FOREIGN KEY (uiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE user_profile
	ADD FOREIGN KEY (uiNo)
	REFERENCES user_info (uiNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



