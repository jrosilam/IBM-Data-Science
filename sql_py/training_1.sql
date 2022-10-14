-- @block 
-- select all
SELECT * 
FROM sf_film;

-- @block
-- select title and director
SELECT title, director 
FROM sf_film;


-- @block
-- select title and director
SELECT title, director, writer 
FROM sf_film;

-- @block
-- find after 2001
SELECT title, release_year, locations 
FROM sf_film 
WHERE release_year>=2001;


-- @block
-- select films and fun_facts
SELECT locations, fun_facts
FROM sf_film;

-- @block
-- select before 2000
SELECT title, locations, release_year
FROM sf_film
WHERE release_year <= 2000;

-- @block
-- select before 2000
SELECT title, production_company, locations, release_year
FROM sf_film
WHERE writer != "James Cameron";

-- @block
DROP TABLE instructor

-- @block
-- create table 
CREATE TABLE IF NOT EXISTS Instructor (
    id INT,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(2)
)

-- @block
DROP TABLE instructor

-- @block
-- create table 
CREATE TABLE IF NOT EXISTS Instructor (
    id INT,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(2)
)

-- @block
-- populate table
INSERT INTO Instructor
    (id, last_name, first_name, city, country)
VALUES
    (1, 'Ahuja','Rav','Toronto','CA'),
    (2, 'Chong','Raul','Toronto','CA'),
    (3, 'Vasudevan','Hima','Chicago','US');

-- @block
SELECT *
FROM instructor;

-- @block
INSERT INTO instructor 
    (id, first_name, last_name, city, country)
VALUEs
    (4, 'Sandip', 'Saha', 'Edmonton', 'CA');

-- @block
INSERT INTO instructor 
    (id, first_name, last_name, city, country)
VALUEs
    (5, 'John', 'Doe', 'Sydney', 'AU'),
    (6, 'Jane', 'Doe', 'Bhaka', 'BD');

-- @block
INSERT INTO instructor 
    (id, first_name, last_name, city, country)
VALUEs
    (7, 'Antonio', 'Canginao', 'Vancouver', 'CA');

-- @block
INSERT INTO instructor 
    (id, first_name, last_name, city, country)
VALUEs
    (8, 'Steve', 'Ryan', 'Barbly', 'GB'),
    (9, 'Ramesh', 'Sanareddy', 'Hyderabad', 'IN');

-- @block
UPDATE instructor 
SET city='Toronto' 
WHERE first_name="Sandip";

-- @block
UPDATE instructor 
SET city='Dubai', country='AE'
WHERE id=5;

-- @block
UPDATE instructor 
SET first_name='Antonio'
WHERE id=7;

-- @block
UPDATE instructor 
SET city='Markham'
WHERE id=1;

-- @block
UPDATE instructor 
SET city='Dhaka', country='BD'
WHERE id=4;

-- @block
DELETE FROM instructor
WHERE id = 6;

-- @block
SELECT *
FROM instructor;

-- @block
DELETE FROM instructor
WHERE first_name='Hima';

--@block
CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );
    
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );

--@block
INSERT INTO PETSALE 
VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');
    
INSERT INTO PET 
VALUES
    (1,'Cat',3),
    (2,'Dog',4),
    (3,'Hamster',2);

--@block
SELECT * 
FROM PETSALE;

--@block
ALTER TABLE PETSALE
ADD COLUMN quantity INT;

--@block
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

--@block
ALTER TABLE PETSALE
DROP COLUMN PROFIT;

--@block
ALTER TABLE PETSALE
MODIFY COLUMN PET VARCHAR(20);

--@block
ALTER TABLE PETSALE
RENAME COLUMN PET TO ANIMAL;

--@block
TRUNCATE TABLE PET IMMEDIATE;

--@block
DROP TABLE pet