-- INSERT INTO `company`.`employee` (`fname`, `minit`) VALUES ('steve', 'jobs');
USE podracing;
-- data type is VARCHAR(45) unless otherwise stated


-- BEING   (id - int, fname, lname, species, is_slave - bool)
INSERT INTO being
VALUES (111, 'steve', 'jobs', 'human', true),
       (222, 'bill', 'gates', 'human', false),
       (333, 'ark', 'roose', 'nuknog', false),
       (444, 'sebulba', null, null, false),
       (555, 'aldar', 'bedoo', 'glymphid', false),
       (666, 'anakin', 'skywalker', 'chosen one', true),
       (777, 'Tyk', 'aloh', 'glymphid', true),
       (999, 'Huig', 'Terrance', null , false),
       (888, 'mueg', 'burngue', 'nuknog', false),
       (000, 'Michael', 'Scarn', 'prisonian', true); 

        
-- PLANET (planet_name, planet_population, cities)
INSERT INTO PLANET
VALUES('Tatooine', '10 billion', 'Mos Espa, Mos Eisley, Anchor Head'),
      ('Alderaan', '20 billion', 'Aldera, Terraium City'),
      ('Malastare', '1 million',  'Pixelito'),
      ('Coruscant', '10 trillion', 'Imperial City, Galactic City');


-- RACER (racer_id - int, b_id - int)
INSERT INTO racer
VALUES(45, 666),
      (56, 000),
      (69, 444),
      (72, 999);


-- VIEWER (b_id - int, ticket_type, race_name) 
INSERT INTO viewer
VALUES(333, 'ROW 3B', 'Aldera 500'), 
      (555, 'ROW 4B', 'Piston cup'),
      (888, 'ROW 4C', 'Tour de Tatooine'),
      (999, 'ROW 1A', 'Piston cup'),
      (111, 'ROW 1E', 'Tour de Tatooine'),
      (222, 'ROW 2B', 'Aldera 500'),
      (777, 'ROW 1A', 'Final Showdown Pt. 2');

-- BET (v_bid - int, r_bid - int, bet_type, amount)
INSERT INTO bet
VALUES(888, 56,'freedom','666 freedom'),
      (555, 72, 'freedom','000 freedom'),
      (777, 69, 'Money', '1000 credits');


-- POD (engine_type, vin - int, pod_weight int, top_seed - int, Modified_flag - bool, racer_bid - int)
INSERT INTO pod
VALUES('Radon-Ulzer 620C racing engines 2', 6969, 1 ,947 ,true , 666 ),
      ('Boulton & Watt 1788', 42069, 200, 730, false, 000),
      ('Thomas Tank 1996 500HP M63', 9000, 105, 1024, false, 000);

-- RACE (stadium_name, city, race_name, pname, rdate) * change order so that city and planet_name
INSERT INTO race
VALUES('Death Valley', 'Aldera', 'Aldera 500', 'Alderaan', 2020-01-01),
      ('Jabba"s Palace', 'Desert', 'Final Showdown Pt. 2', 'Tatooine', 1010-12-01),
      ('Mos Espa Grand Arena', 'Mos Espa', 'Tour de Tatooine', 'Tatooine', 2021 -09-26);

-- is_from (being_id - int, pname)
INSERT INTO is_from
VALUES (111, 'Alderaan'),
       (555, 'Tatooine'),
       (888, 'Alderaan'),
       (444, 'Malastare'),
       (666, 'Tatooine'),
       (777, 'Coruscant');


-- is_in  (vin - int, racer_bid - int, race_name)
INSERT INTO is_in
VALUES (6969, 666, 'Tour de Tatooine'),
       (42069, 444, 'Tour de Tatooine'),
       (9000, 777, 'Final Showdown Pt. 2'),
       (6969, 555, 'Aldera 500'),
       (42069, 000, 'Piston Cup');

-- DROID   (racer_bid - int, droid_number - int, droid_type)
INSERT INTO DROID 
VALUES (666, 1 , 'Engineering'),
       (666, 2, 'Labor-Specialist'),
       (666, 3, 'Hazardous-Service' ),
       (000, 1, 'Engineering'),
       (000, 2, 'Labor-Specialist'),
       (444, 1, 'Engineering'),
       (999, 1, 'Labor-Specialist');


-- CITIES  (city, planet_name)
INSERT INTO CITIES
VALUES ('Mos Espa', 'Tatooine'), 
       ('Mos Eisley', 'Tatooine'),
       ('Anchor Head', 'Tatooine'),
       ('Terraium City', 'Alderaan'),
       ('Aldera', 'Alderaan'),
       ('Imperial City', 'Coruscant'),
       ('Imperial City', 'Coruscant'),
       ('Pixelito', 'Malastare');
