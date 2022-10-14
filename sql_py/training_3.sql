-- Drop the PETRESCUE table in case it exists
drop table PETRESCUE;
--@block
-- Create the PETRESCUE table 
create table PETRESCUE (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);
--@block
-- Insert sample data into PETRESCUE table
insert into PETRESCUE 
    (ANIMAL, QUANTITY, COST, RESCUEDATE)
values 
	('Cat',9,450.09,'2018-05-29'),
	('Dog',3,666.66,'2018-06-01'),
	('Dog',1,100.00,'2018-06-04'),
	('Parrot',2,50.00,'2018-06-04'),
	('Dog',1,75.75,'2018-06-10'),
	('Hamster',6,60.60,'2018-06-11'),
	('Cat',1,44.44,'2018-06-11'),
	('Goldfish',24,48.48,'2018-06-14'),
	('Dog',2,222.22,'2018-06-15')
;

--@block A1--
SELECT SUM(COST)
    FROM petrescue;
--@block A2--
SELECT SUM(COST) as SUM_OF_COST
    FROM petrescue;
--@block A3--
SELECT SUM(QUANTITY)
    FROM petrescue;
--@block A4--
SELECT AVG(COST)
    FROM petrescue;
--@block A5--
SELECT AVG(COST/QUANTITY)
    FROM petrescue
    WHERE LCASE(ANIMAL)='dog';
--@block B1--
SELECT ROUND(COST)
    FROM petrescue;
--@block B2--
SELECT LENGTH(ANIMAL)
    FROM petrescue;
--@block B3--
SELECT UCASE(ANIMAL)
    FROM petrescue;
--@block B4--
SELECT DISTINCT UCASE(ANIMAL)
    FROM petrescue;
--@block B5--
SELECT * 
    FROM petrescue
    WHERE LCASE(ANIMAL) = 'cat';
--@block C1--
SELECT DAY(RESCUEDATE)
    FROM petrescue
    WHERE LCASE(ANIMAL) = 'cat';
--@block C2--
SELECT SUM(QUANTITY)
    FROM petrescue
    WHERE MONTH(RESCUEDATE) = '05';
--@block C3--
SELECT SUM(QUANTITY)
    FROM petrescue
    WHERE DAY(RESCUEDATE) = '14';
--@block C4--
SELECT RESCUEDATE, DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) as Three_day
    FROM petrescue;
--@block C5--
SELECT (CURRENT_DATE - RESCUEDATE) as elapsed_days
    from petrescue;

--@block 1--
SELECT *
    FROM employees
    WHERE SALARY < AVG(SALARY);
--@block 2--
SELECT EMP_ID, F_NAME, L_NAME, SALARY 
    FROM employees
    WHERE SALARY < (SELECT AVG(SALARY) 
                    FROM employees);
--@block 3--
SELECT EMP_ID, SALARY, MAX(SALARY) as MAX_SALARY
    FROM employees;
--@block 4--
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM employees) as MAX_SALARY
    FROM employees;
--@block 5--
SELECT *
FROM (SELECT EMP_ID, F_NAME, L_NAME, JOB_ID, MANAGER_ID, DEP_ID 
      FROM employees) as EMP4ALL;

--@block A1--
SELECT *
    FROM employees
    WHERE JOB_ID IN (SELECT JOB_IDENT
                     FROM jobs);
--@block A2--
SELECT *
    FROM employees
    WHERE JOB_ID IN (SELECT JOB_IDENT
                     FROM jobs
                     WHERE JOB_TITLE = 'Jr. Designer');
--@block A3--
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
    FROM jobs
    WHERE JOB_IDENT IN (SELECT JOB_ID
                     FROM employees
                     WHERE SALARY > 70000);
--@block A4--
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
    FROM jobs
    WHERE JOB_IDENT IN (SELECT JOB_ID
                        FROM employees
                        WHERE YEAR(B_DATE) > 1976);
--@block A5--
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
    FROM jobs
    WHERE JOB_IDENT IN (SELECT JOB_ID
                        FROM employees
                        WHERE YEAR(B_DATE) > 1976
                        AND UCASE(SEX) = 'F');
--@block B1--
SELECT *
    FROM employees, jobs;
--@block B2--
SELECT * 
    FROM employees, jobs 
    WHERE employees.JOB_ID = jobs.JOB_IDENT;
--@block B3--
SELECT *
    FROM employees as E, jobs as J
    WHERE E.JOB_ID = J.JOB_IDENT;
--@block B4--
SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
    FROM employees as E, jobs as J
    WHERE E.JOB_ID = J.JOB_IDENT;
--@block B5--
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
    FROM employees as E, jobs as J
    WHERE E.JOB_ID = J.JOB_IDENT;