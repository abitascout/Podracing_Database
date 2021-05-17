DROP SCHEMA IF EXISTS podracing;
CREATE DATABASE podracing;
USE Podracing;

DROP TABLE IF EXISTS BEING;
CREATE TABLE BEING(
        Id INTEGER NOT NULL,
        Fname VARCHAR(45),
        Lname VARCHAR(45), 
        Species VARCHAR(45), 
        Is_slave BOOLEAN,
    CONSTRAINT being_pk
        PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS RACER;
CREATE TABLE RACER(
        Racer_id INTEGER NOT NULL,
        Bid INTEGER NOT NULL,
    CONSTRAINT racer_pk
        PRIMARY KEY(Bid)
);
		

DROP TABLE IF EXISTS VIEWER;
CREATE TABLE VIEWER(
        Bid INTEGER NOT NULL,
        Ticket_type VARCHAR(45) NOT NULL,
        Race_Name VARCHAR(45),
    CONSTRAINT viewer_pk
        PRIMARY KEY(Bid)
);

DROP TABLE IF EXISTS BET;
CREATE TABLE BET(
    V_bid INTEGER NOT NULL,
    R_bid INTEGER NOT NULL,
    Bet_type VARCHAR(45) NOT NULL,
    Amount VARCHAR(45) NOT NULL,
    CONSTRAINT Bet_pk
        PRIMARY KEY(V_bid, R_bid)
); 

DROP TABLE IF EXISTS POD;
CREATE TABLE POD(
    Engine_type     VARCHAR(45),
    Vin             INTEGER NOT NULL,
    Pod_weight      INTEGER,   
    Top_speed       INTEGER,
    Modified_flag   BOOLEAN,
    Racer_Bid       INTEGER,
    CONSTRAINT Pod_unique
        PRIMARY KEY(Vin)
);

DROP TABLE IF EXISTS RACE;
CREATE TABLE RACE(
    Stadium_name    VARCHAR(45) NOT NULL,
    City            VARCHAR(45) NOT NULL,
    Race_Name       VARCHAR(45) NOT NULL,
    Pname           VARCHAR(45) NOT NULL, 
    Rdate           DATE NOT NULL,
    CONSTRAINT Race_unique
        PRIMARY KEY(Race_Name)
);

DROP TABLE IF EXISTS PLANET;
CREATE TABLE PLANET(
    Planet_Name         VARCHAR(45) NOT NULL,   /* changed from Name to Planet_name */
    Planet_population   VARCHAR(45),            /* changed from Population to Planet_population */
    CONSTRAINT Planet_unique
        PRIMARY KEY(Planet_Name)
);

DROP TABLE IF EXISTS CITIES;
CREATE TABLE CITIES(
    City            VARCHAR(45) NOT NULL,
    Planet_Name     VARCHAR(45) NOT NULL,
    CONSTRAINT Cities_pk
        PRIMARY KEY(City, Planet_Name)
);

DROP TABLE IF EXISTS DROID;
CREATE TABLE DROID(
    Racer_Bid       INTEGER,
    Droid_number    INTEGER,
    Droid_type      VARCHAR(45),
    CONSTRAINT droid_pk
        PRIMARY KEY (Racer_Bid, Droid_number)
);

DROP TABLE IF EXISTS IS_IN;
CREATE TABLE IS_IN(
    Vin             INTEGER,
    Racer_Bid       INTEGER,
    Race_Name       VARCHAR(45),

    CONSTRAINT Is_in_pk
        PRIMARY KEY (Vin, Racer_Bid, Race_Name),
    CONSTRAINT Vin_super_fk
        FOREIGN KEY (Vin) REFERENCES POD(Vin)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT Racer_Bid_super_fk
        FOREIGN KEY (Racer_Bid) REFERENCES RACER(Bid)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT Race_name_fk
        FOREIGN KEY (Race_Name) REFERENCES RACE(Race_Name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS IS_FROM;
CREATE TABLE IS_FROM(
    Being_id  INTEGER,
    Pname     VARCHAR(45),
    CONSTRAINT is_from_pk
        PRIMARY KEY(Being_id, Pname),
    CONSTRAINT Being_id_fk
        FOREIGN KEY (Being_id) REFERENCES BEING(Id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT Planet_name_fk
        FOREIGN KEY (Pname) REFERENCES PLANET(Planet_name)
);


/* Defining refirential integrity constraints (foreign keys) */
ALTER TABLE RACER
	ADD CONSTRAINT Bid_super_fk
		FOREIGN KEY (Bid) REFERENCES BEING(Id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE VIEWER
	ADD CONSTRAINT Viewer_super_fk
		FOREIGN KEY (Bid) REFERENCES BEING(Id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE BET
	ADD CONSTRAINT Bet_V_fk
		FOREIGN KEY (V_Bid) REFERENCES VIEWER(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
    ADD CONSTRAINT Bet_R_fk
		FOREIGN KEY (R_Bid) REFERENCES RACER(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE POD
	ADD CONSTRAINT Pod_super_fk
		FOREIGN KEY (Racer_Bid) REFERENCES RACER(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE RACE
	ADD CONSTRAINT race_super_fk
		FOREIGN KEY (Pname) REFERENCES PLANET(Planet_Name)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE CITIES
	ADD CONSTRAINT Cities_super_fk
		FOREIGN KEY (Planet_Name) REFERENCES PLANET(Planet_Name)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE DROID
	ADD CONSTRAINT Droid_super_fk
		FOREIGN KEY (Racer_Bid) REFERENCES RACER(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;





