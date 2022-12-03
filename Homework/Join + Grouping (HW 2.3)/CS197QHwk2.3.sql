/*
CS197Q Homework assignment 2.3
SQLite note: in JOIN queries with USING, you need to use parentheses to specify the column name.
For example:   TableA JOIN TableB USING (ColumnC) 
  2.13 Join Queries
  2.14 Join Operator
  2.15 Multi-Table Joins
  2.16 Outer Joins
  2.17 Grouping
  2.18 Grouping - the Having Clause
Use the Starr database for this assignment.
Consult the Starr Schema information in the DB Browser and the Starr Database ERD diagram as needed.

NOTE: It is easier to build queries in small steps. For example, if you are writing a join query, 
focus first on getting the join part to work correctly, then you can add any other constraints, and 
finally add the columns you need to the select clause. 
You can open a new SQL editor window to use as a "scratch" window for executing these types of queries.

Remember to remove all SQL that isn't the answer to a question before submitting this file.
*/
/* 1. Write a Join query that retrieves the columns EMP_NUM, EMP_FNAME, EMP_LNAME, and JOB_DESCRIPTION from the 
      EMPLOYEE and JOB tables. The result set should be sorted on employee last name in alphabetical order. 
	  Use a WHERE clause to join the tables on JOB_CODE.
	  You should have 21 rows.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME,  JOB_DESCRIPTION FROM EMPLOYEE
INNER JOIN JOB WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE
ORDER BY EMP_LNAME DESC


/* 2. Write a Join query that retrieves the columns EMP_NUM, EMP_FNAME, EMP_LNAME, JOB_DESCRIPTION, and
      JOB_CHG_HOUR columns from the EMPLOYEE and JOB tables for all employees with a JOB_CHG_HOUR greater than 
	  50.0. Use a WHERE clause to join the tables on JOB_CODE. The results should be sorted in alphabetical order 
	  by the employee last name.
	  You should have 9 rows.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, JOB_DESCRIPTION, JOB_CHG_HOUR
FROM EMPLOYEE 
INNER JOIN JOB WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE AND JOB_CHG_HOUR > 50.0
ORDER BY EMP_LNAME



/* 3. Write a Join query that retrieves the columns EMP_NUM, EMP_FNAME, EMP_LNAME, PROJ_NAME, and PROJ_VALUE 
      from the EMPLOYEE and PROJECT tables. Use the NATURAL JOIN operator. The results should be sorted 
	  in alphabetical order by the employee last name.
	  Make sure you know what relationship between employees and projects you are dealing with in this query.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, PROJ_NAME, PROJ_VALUE FROM EMPLOYEE 
NATURAL JOIN PROJECT
ORDER BY EMP_LNAME




/* 4. Write a Join query that retrieves the columns EMP_NUM, EMP_FNAME, EMP_LNAME, PROJ_NAME, PROJ_VALUE, 
      and PROJ_BALANCE from the EMPLOYEE and PROJECT tables where only rows where the project balance is 
	  strictly greater than one million and strictly less than two million. Use the JOIN or NATURAL JOIN operator. 
	  The results should be sorted in alphabetical order by the employee last name.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE
FROM EMPLOYEE
NATURAL JOIN PROJECT 
WHERE PROJ_BALANCE > 1000000 AND PROJ_BALANCE < 2000000
ORDER BY EMP_LNAME DESC




/* 5. Write a Join query that retrieves the columns EMP_NUM, EMP_FNAME, EMP_LNAME, ASSIGN_DATE, ASSIGN_HOURS, 
      and JOB_DESCRIPTION from the EMPLOYEE, ASSIGNMENT, and JOB tables where only rows for assignments made on
	  March 24th, 2010 are in the result set.  Use any join technique you wish.
	  The results should be sorted in alphabetical order by the employee last name.
	  
*/
SELECT EMP_FNAME, EMP_LNAME, ASSIGN_DATE, ASSIGN_HOURS, JOB_DESCRIPTION
FROM EMPLOYEE
JOIN JOB ON EMPLOYEE.JOB_CODE = JOB.JOB_CODE
JOIN ASSIGNMENT ON EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM
WHERE ASSIGN_DATE = '2010-03-24'
ORDER BY EMP_LNAME ASC




/* 6. Write a Join query that retrieves the columns EMP_FNAME, EMP_LNAME, PROJ_NAME, ASSIGN_DATE, 
      and ASSIGN_HOURS from the PROJECT, ASSIGNMENT, and EMPLOYEE tables where only rows for assignments 
	  made on March 24th, 2010 are in the result set and only for the Evergreen project.  
	  The results should be sorted in alphabetical order by the employee last name.
	  Use any join technique you wish, but make sure your joins are correct! If two tables have more than one relationship
	  between then, a natural join may give incorrect results.
	  NOTE: Each project is managed by one employee. This "manages" role or relationship is implemented 
	  by the EMP_NUM keys in the PROJECT and EMPLOYEE tables. Employees are also assigned to work on projects. 
	  This "assigned" role is implemented by the EMP_NUM keys in the ASSIGNMENT and EMPLOYEE tables.
	  This query deals with the "assigned" role, not the "manages" role. There is only one employee manager
	  for each project, but there are many employees who can be assigned to work on a project. Make sure you
	  write your joins so you are getting the correct relationship in your results.
	  You should have 2 rows.
*/
SELECT EMP_FNAME, EMP_LNAME, PROJ_NAME, ASSIGN_DATE, ASSIGN_HOURS
FROM PROJECT
JOIN ASSIGNMENT ON PROJECT.PROJ_NUM = ASSIGNMENT.PROJ_NUM
JOIN EMPLOYEE ON ASSIGNMENT.EMP_NUM = EMPLOYEE.EMP_NUM
WHERE ASSIGN_DATE = '2010-03-24'   AND PROJ_NAME = 'Evergreen'
ORDER BY EMP_LNAME





/* 7. Write a Join query to retrieve all assignments for Anne Ramoras. The result set should return
      the following columns: EMP_NUM, EMP_FNAME, EMP_LNAME, JOB_DESCRIPTION, ASSIGN_DATE, PROJ_NAME.
	  Check your results to make sure they are correct. You may have to use table names to disambiguate 
	  some of the column names, i.e. tableName.columnName. It's OK to lookup an ID number to use in your query 
	  instead of using a name.
*/
SELECT  EMP_NUM, EMP_FNAME, EMP_LNAME, JOB_DESCRIPTION, ASSIGN_DATE
FROM EMPLOYEE 
NATURAL JOIN JOB
NATURAL JOIN ASSIGNMENT
WHERE EMP_FNAME LIKE '%ANNE%' AND EMP_LNAME LIKE '%RAMORAS%' 



/* 8. Write a LEFT JOIN query that returns the following columns: EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_HIREDATE 
      for employees who do not manage a project (see query 6). The results should be sorted in alphabetical 
	  order by the employee last name.
	  Note: RIGH and FULL (OUTER) JOINs are not implemented in SQLite, so use LEFT JOIN. To get the unmatched rows,
	  test for null values on the right-hand side of the return. 
	  There are 17 employess who are not managing a project.
*/
SELECT EMP_FNAME, EMP_LNAME, EMP_HIREDATE
FROM EMPLOYEE
LEFT JOIN PROJECT ON PROJECT.EMP_NUM = EMPLOYEE.EMP_NUM
WHERE PROJECT.EMP_NUM IS NULL
ORDER BY EMP_LNAME



/* 9. Write Grouping query that calculates the total number of hours that have been assigned 
      for each project. The query displays the PROJ_NUM, PROJ_NAME, and assigns column name TOTAL_HOURS
	  as an alias to the sum of assigned hours for each project.
	  The results should be sorted in alphabetical order by the project name.
*/

SELECT PROJ_NUM, SUM(ASSIGN_HOURS) AS TOTAL_HOURS
FROM ASSIGNMENT
GROUP BY PROJ_NUM

/* 10. Write Grouping query that calculates the total number of assigned hours (ASSIGN_HOURS) for each employee 
       having ASSIGN_CHG_HR strictly greater than 35.00. 
	   The query displays the EMP_NUM, EMP_FNAME, EMP_LNAME, and assigns column name TOTAL_HOURS
	   as an alias to the sum of assigned hours for each employee.
	   The results should be sorted in alphabetical order by the employee last name.
	   Work on the correct join, then you need a grouping clause with a having clause.
*/
SELECT SUM(ASSIGN_HOURS) AS TOTAL_HOURS
FROM ASSIGNMENT
GROUP BY EMP_NUM
HAVING ASSIGN_CHG_HR > 35.00