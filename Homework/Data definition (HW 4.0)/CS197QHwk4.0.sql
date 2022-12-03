/*
CS197Q Homework assignment 4.0
SQL Data definition statements.
  4.1 Create Table Statements
  4.2 Column Definitions
  4.3 Table Constraints
  4.4 Foreign Key Constraints
Use the Starr database for this assignment.

You will be modifying the structure of the Starr database in these exercises. It's a good idea to make a copy of
the Starr.db file to revert to if you need it. Of course, you can always rebuild the Starr.db by running the SQL scripts.

Refer to the Starr Database Homework 4.0 ERD diagram for a view of what the structure you will be adding looks like.

PLEASE remember to remove any SQL other than your answer to the questions below before you submit this assignment.
*/
/* 1. Starr wants to track the assignment of equipment to projects. The first step is to model the data for 
      the types of equipment the company uses. Write a statement to create a table named EQUIPMENT with the 
	  following columns:
	  
      EQUIP_NUM  int 
	  EQUIP_NAME varchar 
	  EQUIP_HR_CHG  float
	  EQUIP_LAST_UPDATE  datetime
	  
	  All columns are required (may not have null values).
	  EQUIP_NUM is the primary key.
*/
CREATE TABLE EQUIPMENT (
   EQUIP_NUM INTEGER NOT NULL,
   EQUIP_NAME VARCHAR NOT NULL,
   EQUIP_HR_CHG FLOAT NOT NULL,
   EQUIP_LAST_UPDATE DATETIME NOT NULL,
   PRIMARY KEY ( EQUIP_NUM ) )







/* 2. The next step is to track assignments of equipment to projects. Each time a piece of equipment is 
      assigned to a project, we want to record the start and end dates of the assignment and the hourly charge rate
	  at the start time (the rate for equipment can be updated over time, but that is tracked in the EQUIPMENT table).
	  Write a statement to create a table named EQUIP_ASSIGN_LOG with the following columns:
	  
      EQUIP_ASSIGN_ID int required 
      EQUIP_ASSIGN_BEGIN date/time required
      EQUIP_ASSIGN_END date/time not required
      EQUIP_ASSIGN_CHG_HR float required
	  
	  EQUIP_ASSIGN_ID is the primary key
*/
CREATE TABLE EQUIP_ASSIGN_LOG (
   EQUIP_ASSIGN_ID INTEGER NOT NULL,
   EQUIP_ASSIGN_BEGIN DATETIME NOT NULL,
   EQUIP_ASSIGN_END DATETIME NULL,
   EQUIP_ASSIGN_CHG_HR FLOAT NOT NULL,
   PRIMARY KEY ( EQUIP_ASSIGN_ID ) )






  

/* 3. The EQUIP_ASSIGN_LOG table also needs to record the equipment that was pared with a project. In a relational
      database, this is implemented by primary key - foreign key references. We need two more columns in the EQUIP_ASSIGN_LOG
	  table that will serve as foreign keys referencing the primary keys in the PROJECT and EQUIPMENT tables.
	  Write statements that add columns called PROJ_NUM and EQUIP_NUM to the EQUIP_ASSIGN_LOG table. The data types
	  of these columns must match the data types of the primary keys they will reference. 

	  Note: in SQLite the syntax to add a foreign key column is:
	                ALTER TABLE [tablename] ADD COLUMN [columnname] datatype REFERENCES tablename(keyname);
	  You can view the table columns by executing this statement:
	  PRAGMA table_info(tablename);
	  (Remember to delete any SQL that isn't an answer to the question before you submit this assignment).
*/
ALTER TABLE EQUIP_ASSIGN_LOG
ADD COLUMN PROJ_NUM INTEGER REFERENCES PROJECT(PROJ_NUM)
ADD COLUMN EQUIP_NUM INTEGER REFERENCES EQUIPMENT(EQUIP_NUM)




/* 4. Write a statement to add a piece of equipment to the EQUIPMENT table with these values: 
      EQUIP_NUM   1001
	  EQUIP_NAME  AC Monitor 
	  EQUIP_HR_CHG  120.00
	  EQUIP_LAST_UPDATE the current date/time (use the date function).
	  
	  It's good practice to execute your statement and check that the data has been recorded.
	 (Remember to delete any SQL that isn't an answer to the question before you submit this assignment).
*/
INSERT INTO EQUIPMENT values (1001, 'AC Monitor', 120.00, '2020-06-22')


/* 5. Write a statement to assign the AC Monitor to the Evergreen project at its current hourly rate starting at
      the current date/time using the date function. The end date is not known at this time. 
	  Use 100 for the primary key value in your statement.
	  It's good practice to execute your statement and check that the data has been recorded.
	 (Remember to delete any SQL that isn't an answer to the question before you submit this assignment).
*/
insert into assignment values (1029, '2020-06-22', 15, null, null, 120.00, null, null)



/* 6. The database designers have agreed that creating new assignment ID numbers is a burden. Therefore, they
      want to make the EQUIP_ASSIGN_ID column in the EQUIP_ASSIGN_LOG table increment automatically with each 
	  new row that is inserted into the table.
	  Once a table has been created it is very tricky to add an autoincrement feature. It can be done in most 
	  DB management systems, but SQLite is not one of them. We will need to delete the table and build it again
	  with the autoincrement feature in the primary key.
	  Write a statement that deletes the EQUIP_ASSIGN_LOG table from the database.
*/
delete from EQUIP_ASSIGN_LOG



/* 7. Now write a single statement that creates the EQUIP_ASSIGN_LOG table with all of the columns including primary 
      and foreign key constraints. 
	  The columns PROJ_NUM and EQUIP_NUM are required.
	  Add the autoincrement to the primary key column. You may use this syntax for the 
	  primary key column definition:   columnname  INT PRIMARY KEY AUTOINCREMENT
	  (Note that the SQL that creates database object such as tables appears in the 
	  "Schema" column of the Database Structure" window in DB Browser).
	  
	  Use this name exactly: fk_EQUIP_ASSIGN_LOG_PROJ for the foreign key constraint on PROJ_NUM. 
	  Use this name exactly: fk_EQUIP_ASSIGN_LOG_EQUIP for the foreign key constraint on EQUIP_NUM.
*/
CREATE TABLE EQUIP_ASSIGN_LOG (
   EQUIP_ASSIGN_ID INT PRIMARY KEY AUTOINCREMENT,
   EQUIP_ASSIGN_BEGIN DATETIME NOT NULL,
   EQUIP_ASSIGN_END DATETIME NULL,
   EQUIP_ASSIGN_CHG_HR FLOAT NOT NULL,
   PROJ_NUM INT fk_EQUIP_ASSIGN_LOG_PROJ
   EQUIP_NUM INT fk_EQUIP_ASSIGN_LOG_EQUIP
   PRIMARY KEY ( EQUIP_ASSIGN_ID ) )











/* 8. Now insert the following two entries into the EQUIP_ASSIGN_LOG table:
      1- Assign the AC Monitor to the Evergreen project at its current rate starting at the
      the current date/time (use the date function). The end date is not known at this time.
      2- Assign the AC Monitor to the Amber Wave project at its current rate starting at the
      the current date/time(use the date function). The end date is not known at this time.      
	  Note that you will have to use this syntax because you will not enter a value for the ID due to the auto increment:
	          INSERT INTO tablename (columnlist) VALUES (valuelist);
	  Test with a select query (but don't include that in your submission).
*/
insert into assignment values (1029, '2020-06-22', 15, null, null, 120.00, null, null)

insert into assignment values (1029, '2020-06-22', 18, null, null, 120.00, null, null)







/* 9.   Add some new equipment to the database: 
        
		1022  High Voltage Transformer  55.00
		3055  Amplifier, 2000W  250.00
		1011  Steam-powered Blade Server 1080.00
		
		Use the date 2017-06-07 for the EQUIP_LAST_UPDATE column for all three.
*/
INSERT INTO EQUIPMENT VALUES ( 1022, 'High Voltage Transformer',  55.00, '2017-06-07')
INSERT INTO EQUIPMENT VALUES ( 3055, 'Amplifier, 2000W',  250.00, '2017-06-07')
INSERT INTO EQUIPMENT VALUES ( 1011, 'Steam-powered Blade Server',  1080.00, '2017-06-07')




/* 10. Finally, write three statements that make the following assignments:
       Equipment                   Project      Start date   End date
	   High Voltage Transformer    Rolling Tide 2016-08-23   2017-11-05
       Amplifier                   Evergreen    now*          null
       Steam-powered Blade Server  Starflight   2017-11-05   2018-01-06
	   
	   *the current date/time(use the date function)
*/
INSERT INTO EQUIP_ASSIGN_LOG VALUES (1002, 22, '2016-08-23', '2017-11-05')
INSERT INTO EQUIP_ASSIGN_LOG VALUES (3055, 15, NOW, NULL)
INSERT INTO EQUIP_ASSIGN_LOG VALUES (1011, 25, '2017-11-05', '2018-01-06')







