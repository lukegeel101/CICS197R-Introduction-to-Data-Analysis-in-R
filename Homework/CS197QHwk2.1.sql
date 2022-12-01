/*
CS197Q Homework assignment 2.1
  2.1 Select Query Intro
  2.2 Distinct
  2.3 Alias
  2.4 The OrderBy Clause
  2.5 Wildcards in Select List
  2.6 Computed Columns 
Use the Starr database for this assignment.
NOTE: Do not modify or add any comments in this file. Enter only your SQL in the spaces provided.
*/
/* 1. Write a SELECT query that retrieves only the columns EMP_FNAME, EMP_LNAME, EMP_HIREDATE
 from the EMPLOYEE table in the Starr database. 
The columns must be in the order specified in the result set. 
The query returns all rows from the table.
*/
SELECT EMP_FNAME, EMP_LNAME, EMP_HIREDATE FROM EMPLOYEE



/* 2. Write a SELECT query that retrieves only the column EMP_NUM from the ASSIGNMENT table. 
   The query returns only DISTINCT rows from the table so that there are no duplicate employee numbers.
   (should be 8 rows in the return).
*/
SELECT DISTINCT EMP_NUM  FROM ASSIGNMENT





/* 3. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_INITIAL, and EMP_LNAME from 
the EMPLOYEE table. Create the following aliases for the columns EMP_FNAME, EMP_INITIAL, and EMP_LNAME: "First Name", 
"M.I." "Last Name" respectively. 
The aliases must appear exactly as specified above in the result set, i.e. must be a space between "First" and "Name". 
The columns must be in the order specified in the result set. The query returns all rows from the table.
*/
SELECT EMP_NUM, EMP_FNAME AS "First  Name", EMP_INITIAL AS "M.I.", EMP_LNAME AS "Last Name" FROM EMPLOYEE




/* 4. Write a SELECT query that retrieves only the columns EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME, and 
EMP_HIREDATE from the EMPLOYEE table. The results must be ordered in ascending (alphabetical) order by the 
employee's last name.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_INITIAL, EMP_LNAME,  EMP_HIREDATE from  EMPLOYEE ORDER BY EMP_LNAME



/* 5. Write a SELECT query that retrieves all columns from the ASSIGNMENT table. The results must be ordered 
in ascending order by the ASSIGN_JOB column and then in ascending order on EMP_NUM in the result set.
*/
SELECT * FROM ASSIGNMENT ORDER BY ASSIGN_JOB ASC, EMP_NUM ASC




/* 6. Write a SELECT query that retrieves all columns from the JOB table. The results must be ordered 
so that the most recent updated job appears first, and the JOB_CHG_HOUR is listed in ascending order
in the result set.  The result set should show the most recently updated jobs first, and all of those rows 
should show the hourly rates with the lowest rate first.
*/
SELECT * FROM JOB ORDER BY JOB_LAST_UPDATE DESC, JOB_CHG_HOUR ASC 




/* 7. Write a SELECT query that retrieves the EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_HIREDATE columns 
from the EMPLOYEE table. The results must be ordered by last name in alphabetical order and then by hire date
in descending (latest to earliest) order. For example, if several employees have the same last name, the last to be 
hired appears first, etc.
*/
SELECT EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_HIREDATE FROM EMPLOYEE ORDER BY EMP_LNAME DESC, EMP_HIREDATE DESC





/* 8. Write a SELECT query that retrieves the columns PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE from
the PROJECT table. The query also computes the difference of the project's value and the project's balance
as another column aliased as PROJ_REMAINDER.
*/
SELECT PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE, PROJ_VALUE-PROJ_BALANCE AS PROJ_REMAINDER FROM PROJECT




/* 9. Write a SELECT query that retrieves the columns PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE from
the PROJECT table. The query also computes the difference of the project's value and the project's balance
as another column aliased as PROJ_REMAINDER. The result set should be ordered on PROJ_REMAINDER where the
lowest value appears first and the greatest value appears last in the result set.
*/
SELECT PROJ_NUM, PROJ_NAME, PROJ_VALUE, PROJ_BALANCE, PROJ_VALUE-PROJ_BALANCE AS PROJ_REMAINDER FROM PROJECT ORDER BY PROJ_REMAINDER ASC





/* 10. Write a SELECT query that retrieves the columns ASSIGN_NUM, ASSIGN_CHG_HR, ASSIGN_HOURS from
the ASSIGNMENT table. The query also computes the product of the hourly rate and the assignment hours
as another column aliased as ASSIGN_COST. The result set should be ordered on ASSIGN_COST, where the
lowest value appears first and the greatest value appears last in the result set.

*/
SELECT ASSIGN_NUM, ASSIGN_CHG_HR, ASSIGN_HOURS, ASSIGN_CHG_HR * ASSIGN_HOURS AS ASSIGN_COST FROM ASSIGNMENT ORDER BY ASSIGN_COST ASC





