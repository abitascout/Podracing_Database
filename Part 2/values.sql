-- INSERT INTO `company`.`employee` (`fname`, `minit`) VALUES ('steve', 'jobs');
USE podracing;
/*
data type is VARCHAR(45) unless otherwise stated
*/


-- BEING   (id - int, fname, lname, species, is_slave - bool)
INSERT INTO being
VALUES (111, 'steve', 'jobs', 'human', true),
       (222, 'bill', 'gates', 'human', false),
       (666, 'anakin', 'skywalker', 'chosen one', true),
       (444, 'sebulba', null, null, false),
       (555, 'aldar', 'bedoo', 'glymphid', false),
       (777, 'Tyk', 'aloh', 'glymphid', true),
       (999, 'Huig', 'Terrance', null , false),
       (888, 'mueg', 'burngue', 'nuknog', false),
       (000, 'Michael', 'Scarn', 'prisonian', true),
       (333, 'ark', 'roose', 'nuknog', false); 

        
-- PLANET (planet_name, planet_population, cities)
INSERT INTO PLANET
VALUES('Tatooine', '10 billion', 'Desert'),
      ('Tatooine', '10 billion', 'Mos Doba'),
      ('Tatooine', '10 billion', 'Anchor Head'),
      ('Alderaan', '20 billion', 'Aldera'),
      ('Alderaan', '20 billion', 'Terrarium City');


-- RACER (racer_id - int, bid - int)
INSERT INTO racer
VALUES(45, 666),
      (56, 000),
      (69, 444),
      (72, 999);


--VIEWER (bid - int, ticket_type, race_name) 
INSERT INTO viewer
VALUES( 333,'ROW 3B', 'Piston cup'), 
      ( 555, 'ROW 3B', 'Piston cup');

-- BET (v_bid - int, r_bid - int, bet_type, amount)
INSERT INTO bet
VALUES( , , , );


-- POD (engine_type, vin - int, pod_weight int, top_seed - int, Modified_flag - bool, racer_bid - int)
INSERT INTO pod
VALUES( 'Radon-Ulzer 620C racing engines 2', 6969, 1 ,947 ,true , 666 );

-- RACE (stadium_name, city, race_name, pname, rdate) * change order so that city and planet_name
INSERT INTO race
VALUES('Death Valley', 'Aldera', 'race_name', 'Alderaan', 2020-01-01),
      ("Jabba's Palace", 'Desert', 'Final Showdown Pt. 2', 'Tatooine', 1010-12-01)
;

-- is_from (being_id - int, pname)
INSERT INTO is_from
VALUES ( , )
;


-- is_in  (vin - int, racer_bid - int, race_name)
INSERT INTO is_in
VALUES ( , , )
;

-- DROID   (racer_bid - int, droid_number - int, droid_type)
INSERT INTO DROID 
VALUES ( , , )
;


-- CITIES  (city, planet_name)
INSERT INTO CITIES
VALUES ( , )
;

 -- PLANET  (planet_name, planet_population, cities)
INSERT INTO PLANET
VALUES ( ,  , )
;
