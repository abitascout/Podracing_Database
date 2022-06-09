-- inlcude description of what each command does

-- Commands

/* Insert, Delete, and Update */

-- INSERT
-- Add George Lucas to beings.
INSERT INTO BEING
VALUES (100, 'George', 'Lucas', 'human', true);

-- DELETE
-- Delete George Lucas using his id.
DELETE FROM BEING
WHERE id=100;

-- UPDATE
-- Anakin is no longer a slave
UPDATE BEING
SET Is_slave = false
WHERE id=666;

/* 3 standard retrieval queries */
-- Retreiving first name, last name of Beings whose species is NULL or Not known 
SELECT fname, lname
FROM Being
WHERE species IS NULL;

-- Retreive the types of Droid used in a particlar race
SELECT D.droid_type, V.race_name
FROM Viewer AS V, Droid AS D
WHERE V.Bid = D.racer_bid;

-- Retrieve the droid type and the first name of the being that owns the droid
SELECT Droid_type, B.fname
From Droid D, Being B
WHERE D.Racer_bid = B.id;


/* 2 complex retrieval queries (nested, aggregate, groupby, having, etc.) */

-- for each planet, grouped by planet name, show the name of the planet show the number of beings from that planet, and the population of the planet
SELECT p.planet_name, p.planet_population, count(*) AS num_of_beings_from_this_planet
FROM being b, is_from i, planet p
WHERE i.being_id =  b.id AND p.planet_name = i.pname
GROUP BY p.planet_name;

-- get the racer names (grouped by their names) that have at least 2 droids
SELECT b.fname, COUNT(*) as Num_droids
FROM racer r, droid d, being b
WHERE d.racer_bid = r.bid AND r.bid = b.id
GROUP BY b.fname
HAVING COUNT(*) >= 2; 



/* 1 trigger */

-- This trigger prevents a viewer from being added and shows the appropriate error message if a viewer does not have a ticket.
DELIMITER $$
CREATE TRIGGER no_ticket_for_viewer
BEFORE INSERT ON viewer
FOR EACH ROW
BEGIN 
    DECLARE MSG VARCHAR(500);
    IF(new.ticket_type = NULL or new.ticket_type = '')
    THEN
        SET MSG = ('The viewer has no ticket.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = MSG;
    END if;
END $$
DELIMITER ;;

-- Testing the trigger
insert into viewer
values (14553, '', 'james');


/* 3 views */
-- create view of pod owners' first and last names and species 
CREATE VIEW Pod_Owners
AS SELECT Fname, Lname, Species, Vin, Engine_type
FROM being b, pod p
WHERE b.Id = p.Racer_Bid
GROUP BY Fname, Lname;

-- create view of the bidders names and the names of the racers who are in a race whom the viewers are bidding on 
CREATE VIEW bidders_names_on_in_race_racers
AS SELECT concat(vb.Fname, " " ,vb.Lname) AS viewer, Bet_type, rb.Fname AS racer, Amount, i.Race_Name
FROM being rb, being vb, bet b, viewer v, is_in i
WHERE b.R_bid = rb.Id AND b.V_bid = vb.Id AND i.Racer_Bid = b.R_bid
GROUP BY viewer, racer;

-- create view of droids that are viewing a race 
CREATE VIEW droid_viewers 
AS SELECT D.Droid_number, D.droid_type, V.race_name
FROM Viewer AS V, Droid AS D
WHERE V.Bid = D.racer_bid;

/* 1 schema modifications(ALTER) */
-- change the DROID NUMBER datatype from int to varchar 
ALTER TABLE `DROID`
	CHANGE COLUMN  `Droid_Number` `Droid_Number` varchar(250) NOT NULL;


