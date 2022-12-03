/*
CS197Q Homework assignment 2.2
  2.7   Where Clause Intro
  2.8   Where Clause Comparison Operator
  2.9   The Like Operator
  2.10 The Between Operator
  2.11 Propositional Logic
  2.12 Where Clause Logical Operators I
Use the Starr database for this assignment.

  NOTE: In many cases, you can check your results by executing "exploratory" queries and inspecting the 
        table values directly. For example, select * from employee will show you the entire table. You 
	    can then look at the rows that the query you are crafting should return and check that against
	    the results it actually returns. In some cases, the number of rows you should get is provided.
	    Don't be afraid to execute these "exploratory" queries when you are building a complex query.
	Remember not to include any of these in the file you turn in- only your answers to the questions.
*/
/* 1. Write a SELECT query that retrieves all columns from the EMPLOYEE table and only
   rows where the employee's last name is Smith. 
*/
select * from EMPLOYEE where EMP_LNAME = 'Smith'


/* 2. Write a SELECT query that retrieves all columns from the EMPLOYEE table and only
   rows where the employee's hire date was after January 15th, 2000.
*/
select * from EMPLOYEE where EMP_HIREDATE > '2000-01-15'


/* 3. Write a SELECT query that retrieves all columns from the EMPLOYEE table. Add a condition in a WHERE clause 
      so that only rows where employee years are greater than or equal to 10 are in the result set. 
	  Also, sort the result set by employee last name in alphabetical order.
*/
select * from EMPLOYEE where EMP_HIREDATE >= 10 ORDER BY EMP_LNAME


/* 4. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME, and 
      EMP_HIREDATE from the EMPLOYEE table. Add a condition in a WHERE clause so that only rows where 
	  employees with last names beginning with the letter 'S' are in the result set. 
      The results must be ordered in alphabetical order by the employee's last name and then by first name.
	  You should have 6 rows in the result set.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME, EMP_HIREDATE 
from EMPLOYEE
WHERE EMP_LNAME LIKE 'S%' 
ORDER BY EMP_LNAME, EMP_FNAME


/* 5. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME, and 
      EMP_HIREDATE from the EMPLOYEE table. Add a condition in a WHERE clause so that only rows where 
	  employees that were hired in the 1990's are in the result set. Use the LIKE operator with a wildcard in this clause.
      The results must be ordered by hire date from most recent hire date to oldest hire date.
	  You should have 16 rows in the result set.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME, EMP_HIREDATE 
from EMPLOYEE
WHERE EMP_HIREDATE LIKE '%199%' 
order by EMP_HIREDATE DESC


/* 6. Write a SELECT query that retrieves the PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE columns 
      from the PROJECT table. Add a condition in a WHERE clause so that only rows where the project values
	  are between one million and three million are in the result set. Use the BETWEEN operator in this clause.
	  The result set must be sorted in alphabetical order by PROJ_NAME.
	  (You can check your results by inspecting the PROJECT table directly with a select * from project query).
*/
SELECT PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE 
FROM PROJECT
WHERE PROJ_VALUE BETWEEN 1000000 AND 3000000
order by PROJ_NAME


/* 7. Write a SELECT query that retrieves the JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR columns 
      from the JOB table. Add a condition in a WHERE clause so that only rows where the job description
	  includes the word 'Engineer' and the hourly rate is at least $60.00 are in the result set. 
*/
SELECT JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR
FROM JOB 
WHERE JOB_DESCRIPTION LIKE  '%Engineer%'  AND JOB_CHG_HOUR > 60.00



/* 8. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_LNAME, and 
      EMP_HIREDATE from the EMPLOYEE table. Add a condition in a WHERE clause so that only employees
	  with employee numbers 104, 107, and 116 are in the result set. 
      The results must be ordered in alphabetical order by the employee's last name.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_HIREDATE
FROM EMPLOYEE
WHERE EMP_NUM = 104 OR 107 OR 116 
order BY EMP_LNAME


/* 9. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_LNAME, and 
      EMP_HIREDATE from the EMPLOYEE table. Add a condition in a WHERE clause so that all employees
	  are in the result set except employees 108 and 111. 
      The results must be ordered in alphabetical order by the employee's last name.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_HIREDATE
FROM EMPLOYEE
WHERE EMP_NUM  != 108 AND EMP_NUM  != 111
order BY EMP_LNAME


/* 10. Write a SELECT query that retrieves only the columns ASSIGN_NUM, ASSIGN_DATE, PROJ_NUM, 
       ASSIGN_CHG_HR, and ASSIGN_HOURS from the ASSIGNMENT table. Add a condition in a WHERE clause 
	   so that only assignments with at least 3 but less than 4 assign hours or assignments with 
	   assignment charge hours more than 100 are included in the result set.
       The results must be ordered in ascending order by the assignment number.
	   You should have 12 rows in the result set.
*/
SELECT ASSIGN_NUM, ASSIGN_DATE, PROJ_NUM, ASSIGN_CHG_HR, ASSIGN_HOURS
FROM ASSIGNMENT
WHERE ASSIGN_HOURS BETWEEN 3 AND 4 OR ASSIGN_CHG_HR > 100 
order by ASSIGN_NUM asc 