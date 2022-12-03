/*
CS197Q Homework assignment 3.0
SQL Data manipulation statements:
  3.1 Insert
  3.2 Update
Use the Starr database for this assignment.

   Since you will be modifying the data in the Starr database, you may want to undo your modification if the results are 
   not what you want. There are several methods for doing this (see the text). One is to use a DELETE statement. Another
   is to execute a BEGIN; statement, then execute your insert or update  statement. If you want to undo the effects of the 
   statement, execute ROLLBACK;. To save the modification execute COMMIT;
   For example:
   BEGIN;
   update etc...
   ROLLBACK;
   
   PLEASE remember to remove all BEGIN; ROLLBACK; and COMMIT; statements from this file before you submit.
   It's not a bad idea make another copy of the database file and use it for this activity. Of course you can always
   re-create the database from the script files as well.
   REMEMBER: Add the proper constraint to update statements that are modifying a subset of rows in the table.
   An unconstrained update will modify ALL rows of the table. You can use BEGIN and ROLLBACK to undo any mistakes.
   COMMIT will "save" the update.
   
   SQLite: The DB Browser will prompt you to save any changes to the database when you close it. Answering no will rollback changes. 
   Of course, it you committed any changes by executing a COMMIT then those changes are saved.
   
   One tip with updates: you can test your update to make sure you are going to update the correct rows by writing a select query
   that uses the same constraint as the update. Run the select query to see if the constraint is accessing the correct rows.
   Then, you can run the select query after you execute the update query to check the update.
   
   You can open a new SQL window to use as a "scratch pad" to execute queries as you develop your final answers to the questions below.
   
   PLEASE remember to remove any SQL other than your answer to the questions below.
*/
/* 1. Write a statement that will create a new job type:
      Description:  Musician
	  Hourly charge: 25.5025.5
	  Last update: the current date (you must use the "date" function- see: https://sqlite.org/lang_datefunc.html)
	  Note: check that your statement executed with a select query. 
*/
insert into Job values (511, 'Musician', 25.50, '2020-06-21')



/* 2. Write an INSERT statement to add a new employee with the following data:
      First name:  John
	  Last name:  Coltrane
	  Initial:   W
	  Hiredate:  January 1, 2017
	  Job code:  Musician (you need to use the correct primary key value for this JOB here).
	  Hire years: 1
	  Check your result with a select query.
	  Note: This query will not work unless you sucessfully execute the previous query from question 1. Remember
	  that relationships (also called dependencies) between tables are accomplished by primary-foreign keys.
	  You need to use the primary key value for the JOB of Musicial in this update. You also need to use a unique integer for the 
	  primary key for this employee. It's best to use the next number after the max that currently exists in the table.
	  You can find that number: select max(emp_num) from employee;
	  Remember to remove any SQL other than your answer to this question.
*/
insert into Employee values (122, 'John', 'Coltrane', 'W', '2017-01-01', 511, 1)


/* 3. Write an INSERT statement to add a new project with the following data:
      project number:  26
	  name:  Blue Note
	  value:   1,500,000
	  balance:  0.00
	  manager:  null (haven't decided yet)
	  Check your result with a select query.
	  Note: If you execute the statement with above values you get an error. You are violating a constraint
	  placed on one of the columns in the PROJECT table. Fix this problem by making Darlene Smithson the 
	  project manager. Make sure you execute the above statement with the null value so you get the experience 
	  of seeing and fixing the error. 
*/
insert into Project values (26, 'Blue Note', 1500000, 0.00, 112)


/* 4. Write a statement that will assign employee John Coltrane to the Blue Note project. He is assigned 
      as a Musician, for 5 hours and ASSIGN_CHG_HR of 25.50. The assign date is the current date/time 
	  (see query 1). Assign charge is null.
	  Remember that the order of the values is citical in an insert statement.
*/
insert into assignment values (1026, '2020-06-21', 26, 122, 511, 25.50, 5, null)



/* 5. Write a statement that will assign employee Tom Jones to the Blue Note project. He is assigned 
      as a Musician, for 3.5 hours and ASSIGN_CHG_HR of 25.50. (litle did we know he could sing the blues)!
	  The assign date is the current date/time (you must use the date function- see query 1).
	  The value for assign charge is null.
*/
insert into assignment values (1027, '2020-06-21', 26, 121, 511, 25.50, 3.5, null)


/* 6. Write a statement that updates the manager of the Blue Note project. The new manager is Susan Smith.
*/
UPDATE PROJECT SET EMP_NUM = 119 WHERE PROJ_NUM = 26

	
/* 7.  The ASSIGN_CHARGE column in the ASSIGNMENT table should store the hourly charges based on the 
       product of the assignment hours and the (historical) hourly rate for the job code. 
	   For example,  ASSIGN_CHARGE for assignment 1005 should be: 96.75 * 2.2 = 212.85.
	   Write a statement that updates the ASSIGN_CHARGE column using this formula for all rows
	   in the ASSIGNMENT table.
*/
UPDATE ASSIGNMENT 
SET ASSIGN_CHARGE = ASSIGN_HOURS * ASSIGN_CHG_HR


/* 8. Write a statement that updates the balance of the Blue Note project in the PROJECT table. 
      Use the PROJ_NUM value for this project in your statement. The updated balance should
      be the current value of the project minus the sum of all values in the ASSIGN_CHARGE column in 
	  the ASSIGNMENT table for the Blue Note project. Write a SELECT query to get this value to use 
	  in your update statement. Use parentheses around the SELECT query.
	  Do not use the litoral value for the sum here, use the select query that returns that sum.
	  For example:  balance = value - (select query to get the sum)
*/
Update PROJECT 
set PROJ_BALANCE = PROJ_BALANCE - SUM(SELECT ASSIGN_CHARGE FROM ASSIGNMENT WHERE PROJ_NUM = 26)
where PROJ_NUM = 26

/* 9. Write a statement that updates the programmer charge rate from 35.75 to 67.55. Update the 
      job last update column to the current date in the same statement.
	  Use the date function to get the current date/time (as in query 1).
*/
UPDATE JOB 
SET JOB_CHG_HOUR = 67.55, JOB_LAST_UPDATE = '2020-06-21'
WHERE JOB_DESCRIPTION = 'Programmer'


/* 10. Write a statement that assigns programmer Maria Alonzo to the Blue Note project (as a programmer).
       She is assigned for 16.00 hours. Use the current date for the assignment, using the date function as in query 1. 
	   Make sure the ASSIGN_CHG_HR is set to the current hourly rate for a programmer and that ASSIGN_CHARGE is correctly updated. 
	   Use a select query to get the ASSIGN_CHG_HR value, do NOT hard code the value in your statement. 
	   You need this value twice, so repeat the SELECT query twice. Use parentheses around the query. 
	   Thus, your insert statement will contain two select queries.
*/
INSERT INTO ASSIGNMENT VALUES (1029, '2020-06-21', 26, 107, 500, (SELECT JOB_CHG_HR FROM JOB WHERE JOB_CODE = 500), 16.00,  16.00 * (SELECT JOB_CHG_HR FROM JOB WHERE JOB_CODE = 500) )