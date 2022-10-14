------------------------------------------
-- DDL statement for table 'HR' database--
--------------------------------------------
-- Drop the tables in case they exist
--@block
DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;

-- Create the tables
--@block 
CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(30) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );


--@block
LOAD DATA 
    LOCAL 
    INFILE 'Python/coursera/trainings/sql_py/csv/Departments.csv'
    INTO TABLE DEPARTMENTS
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

--@block
LOAD DATA 
    LOCAL 
    INFILE 'Python/coursera/trainings/sql_py/csv/Employees.csv'
    INTO TABLE EMPLOYEES
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (EMP_ID, F_NAME, L_NAME, SSN, @var1, SEX, ADDRESS, JOB_ID, SALARY, MANAGER_ID, DEP_ID)
    set B_DATE = STR_TO_DATE(@var1, '%m/%d/%Y');

--@block
LOAD DATA 
    LOCAL INFILE 'Python/coursera/trainings/sql_py/csv/Jobs.csv'
    INTO TABLE JOBS
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

--@block
LOAD DATA 
    LOCAL INFILE 'Python/coursera/trainings/sql_py/csv/JobsHistory.csv'
    INTO TABLE JOB_HISTORY
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (EMPL_ID, @var1, JOBS_ID, DEPT_ID)
    set START_DATE = STR_TO_DATE(@var1, '%m/%d/%Y');;

--@block
LOAD DATA LOCAL INFILE 'Python/coursera/trainings/sql_py/csv/Locations.csv'
INTO TABLE LOCATIONS
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

--@block
SELECT F_NAME, L_NAME 
    FROM employees
    WHERE ADDRESS LIKE '%Elgin,IL%';

--@block
SELECT *
    FROM employees
    WHERE B_DATE LIKE '197%';

--@block
SELECT *
    FROM employees
    WHERE (SALARY BETWEEN 60000 AND 70000)
        AND DEP_ID = 5;

--@block
SELECT * 
    FROM employees
    ORDER BY DEP_ID;

--@block
SELECT D.DEP_NAME, E.F_name, E.L_NAME
    FROM employees as E, departments as D
    WHERE E.DEP_ID = D.DEPT_ID_DEP
    ORDER BY D.DEP_NAME, E.L_NAME DESC;

--@block
SELECT D.DEP_NAME, COUNT(E.DEP_ID) as num_employees, AVG(E.SALARY) as avg_salary
    FROM departments as D, employees as E
    WHERE D.DEPT_ID_DEP = E.DEP_ID
    GROUP BY D.DEP_NAME
    ORDER BY avg_salary DESC;

--@block
SELECT D.DEP_NAME, COUNT(E.DEP_ID) as num_employees, AVG(E.SALARY) as avg_salary
    FROM departments as D, employees as E
    WHERE D.DEPT_ID_DEP = E.DEP_ID
    GROUP BY D.DEP_NAME
    HAVING COUNT(E.DEP_ID) < 4
    ORDER BY avg_salary DESC;