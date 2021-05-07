DROP SCHEMA IF EXISTS podracing;
CREATE DATABASE podracing;
USE Podracing;

DROP TABLE IF EXISTS being;
CREATE TABLE being(
        Id INTEGER NOT NULL,
        Fname VARCHAR(45),
        Lname VARCHAR(45), 
        Species VARCHAR(45), 
        Is_slave BOOLEAN,
    CONSTRAINT being_pk
        PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS racer;
CREATE TABLE racer(
        Racer_id INTEGER NOT NULL,
        Bid INTEGER NOT NULL,
    CONSTRAINT racer_pk
        PRIMARY KEY(Bid)
);
		

DROP TABLE IF EXISTS viewer;
CREATE TABLE viewer(
        Bid INTEGER NOT NULL,
        Ticket_type VARCHAR(45) NOT NULL,
        Race_name VARCHAR(45),
        /* Viewercol VARCHAR(45), -- not in eer diagram/schema*/
    CONSTRAINT viewer_pk
        PRIMARY KEY(Bid)
);

DROP TABLE IF EXISTS bet;
CREATE TABLE bet(
    V_bid INTEGER NOT NULL,
    R_bid INTEGER NOT NULL,
    Bet_type VARCHAR(45) NOT NULL,
    Amount VARCHAR(45) NOT NULL,
    CONSTRAINT Bet_pk
        PRIMARY KEY(V_bid, R_bid)
); 

DROP TABLE IF EXISTS pod;
CREATE TABLE pod(
    Engine_type     VARCHAR(45),
    Vin             INTEGER NOT NULL,
    Pod_weight      INTEGER,   /* changed from weight because weight is a keyword*/
    Top_speed       INTEGER,
    Modified_flag   BOOLEAN,
    Racer_Bid       INTEGER,
    CONSTRAINT Pod_unique
        PRIMARY KEY(Vin)
);

DROP TABLE IF EXISTS race;
CREATE TABLE race(
    Stadium_name    VARCHAR(45) NOT NULL,
    City            VARCHAR(45) NOT NULL,
    Race_name       VARCHAR(45) NOT NULL,
    Pname           VARCHAR(45) NOT NULL, 
    Rdate           DATE NOT NULL,
    CONSTRAINT Race_unique
        PRIMARY KEY(Race_Name)
);

DROP TABLE IF EXISTS planet;
CREATE TABLE planet(
    Planet_name         VARCHAR(45) NOT NULL,   /* changed from Name to Planet_name */
    Planet_population   VARCHAR(45),            /* changed from Population to Planet_population */
    Cities              VARCHAR(45),
    CONSTRAINT Planet_unique
        PRIMARY KEY(Planet_Name)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
    City            VARCHAR(45) NOT NULL,
    Planet_name     VARCHAR(45) NOT NULL,
    CONSTRAINT Cities_pk
        PRIMARY KEY(City, Planet_Name)
);

DROP TABLE IF EXISTS droid;
CREATE TABLE droid(
    Racer_Bid       INTEGER,
    Droid_number    INTEGER,
    Droid_type      VARCHAR(45),
    CONSTRAINT droid_pk
        PRIMARY KEY (Racer_Bid, Droid_number)
);

DROP TABLE IF EXISTS is_in;
CREATE TABLE is_in(
    Vin             INTEGER,
    Racer_Bid       INTEGER,
    Race_name       VARCHAR(45),

    CONSTRAINT is_in_pk
        PRIMARY KEY (Vin, Racer_Bid, Race_name),
    CONSTRAINT Vin_super_fk
        FOREIGN KEY (Vin) REFERENCES POD(Vin)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT Racer_Bid_super_fk
        FOREIGN KEY (Racer_Bid) REFERENCES Racer(Bid)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT Race_name_fk
        FOREIGN KEY (Race_name) REFERENCES Race(Race_Name)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS is_from;
CREATE TABLE is_from(
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
ALTER TABLE racer
	ADD CONSTRAINT Bid_super_fk
		FOREIGN KEY (Bid) REFERENCES Being(Id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE viewer
	ADD CONSTRAINT Viewer_super_fk
		FOREIGN KEY (Bid) REFERENCES Being(Id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE bet
	ADD CONSTRAINT Bet_V_fk
		FOREIGN KEY (V_Bid) REFERENCES Viewer(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
    ADD CONSTRAINT Bet_R_fk
		FOREIGN KEY (R_Bid) REFERENCES Racer(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE pod
	ADD CONSTRAINT Pod_super_fk
		FOREIGN KEY (Racer_Bid) REFERENCES Racer(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE race
	ADD CONSTRAINT race_super_fk
		FOREIGN KEY (Pname) REFERENCES Planet(Planet_Name)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE cities
	ADD CONSTRAINT Cities_super_fk
		FOREIGN KEY (Planet_name) REFERENCES Planet(Planet_Name)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;

ALTER TABLE droid
	ADD CONSTRAINT Droid_super_fk
		FOREIGN KEY (Racer_Bid) REFERENCES Racer(Bid)
			ON DELETE RESTRICT
			ON UPDATE CASCADE;





