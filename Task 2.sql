-- 2. (Medium) Perform read operation on the designed table created in the above task.
USE Travego_Travellers;

SELECT * FROM price;
SELECT * FROM passenger;
/* OBSERVATION :
				1. The USE command is used for selecting the database called Travego_Travellers.
                2. The SELECT command is used wit operator '*' to view all the records of the table
                3. The PRICE table contains the column like 'Id', 'Bus_type','Distance','Price'
                4. The PASSENGER table contains the column like 'Passenger_id', 'Passenger_name',
                   'Category', 'Gender', 'Boarding_City', 'Destination_City', 'Distance',
				   'Bus_Type'.
				5. 'Pasenger_id' of passenger table is the foreign key which refers 'id' of PRICE table	
*/

###############################################################################################################

-- a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)

SELECT COUNT(Gender) AS Number_of_Female_passengers, Distance  FROM passenger
		WHERE Gender = 'F' AND Distance >= 600
		GROUP BY Distance;

/*	OBSERVATION :
				  1. The COUNT function will return the count of non-null values.
                  2. The GROUP BY clause categorize the data of the specified column.
                  3. Here the query display the number of female passengers who travelled
                     more than 600 kms with the respective distance.
*/

##############################################################################################################

/* b. Write a query to display the passenger details whose travel distance
 is greater than 500 and who are traveling in a sleeper bus. (2 marks) */
 
 SELECT * FROM passenger
 WHERE  Distance > 500 AND Bus_Type = 'Sleeper';

/* OBSERVATION :
				1. SELECT statement will retrieve the data from the table according to the condition provided.
                2. The FROM clause is used to select particular table within the database.
                3. The WHERE clause will check the given condition and display the result.
                4. The AND operator is used to check both condition, and display the record
				   if both condition is satisfied.
				5. Hence the sql query is to display the passenger details whose travel distance
 is greater than 500 and who are traveling in a sleeper bus.
				6. According to the query 4 records are displayed.
 */

#################################################################################################################
 
-- c. Select passenger names whose names start with the character 'S'.(2 marks)

SELECT Passenger_name FROM passenger
	   WHERE Passenger_name LIKE 'S%';

/*
		OBSERVATION :
						1. WHERE clause is used to select the rercords according to the condition.
                        2. LIKE clause is used for pattern matching in SQL queries.
                        3. It is typically used with the 'WHERE' clause to search for specific patterns 
                           within a column.
						4. Here the query display the passenger_name records from 'passenger' table
						   where Passenger_name starts with S which is 'Sejal'.
                           
*/

###################################################################################################################

/* d. Calculate the price charged for each passenger, displaying the Passenger name, 
Boarding City, Destination City, Bus type, and Price in the output. (3 marks) */

SELECT p.Passenger_id, p.Passenger_name, p.Boarding_City,
	   p.Destination_City, p.Bus_Type, pr.Price AS Price_charged
       FROM passenger p 
       INNER JOIN price pr ON p.Passenger_id = pr.id;
       
/* 		OBSERVATION :
				1. Joins are used when you need to fetch data that is spread across multiple tables.
                2. It is connected through a common column, typically known as a "foreign key."
                3. By using joins, the rows are combined from these tables to create a result
				   set that contains information from all the tables involved.
				4. The "AS" keyword in SQL is used to provide an alias or alternative name 
					for a table or column in a query.
				5. Here the passenger details are displayed in one table and price is displayed in another table.
                6. Hence they are displayed in a single output using JOINS through a common column
                   called passenger_id.
                7. INNER JOIN / JOIN is used to get matched recrods between two tables.
*/

#######################################################################################################################

/* e. What are the passenger name(s) and the ticket price for those who
 traveled 1000 KMs Sitting in a bus? (4 marks) */
 
SELECT p.Passenger_name, pr.Price AS Ticket_Price
	  FROM passenger p	
      LEFT JOIN price pr ON p.Distance = pr.Distance AND p.Bus_Type = pr.Bus_Type
      WHERE p.Distance = 1000 AND p.Bus_Type = 'Sitting'; 

/*OBSERVATION : 
				1. Passenger_name from passenger table and Price column from Price table 
				   is displayed in a single output using INNER JOIN.
				2. The SQL query gets the passenger_name and price from price table
                   using LEFT JOINS for those who traveled 1000 KMs Sitting in a bus.
				3. As there are no person traveled 1000 KMs sitting it returns empty values.
*/

 
########################################################################################################################

/* f. What will be the Sitting and Sleeper bus charge for Pallavi to travel
 from Bangalore to Panaji? (5 marks) */ 
 
SELECT * FROM passenger;
SELECT * FROM price;
 
 INSERT INTO passenger VALUES
 (10, 'Pallavi', 'AC', 'F',	'Bengaluru', 'Panaji', 600, 'Sitting');
 
 
SELECT p.Passenger_name,pr.Bus_Type,pr.Distance, pr.Price
FROM price AS pr
INNER JOIN passenger AS p ON p.Bus_Type = pr.Bus_Type
WHERE p.Passenger_name = 'Pallavi'
AND pr.Distance = 600;

/*OBSERVATION :
				1. Passenger_name from passenger table and Bus_type, Distance, Price from 
				   Price table are joined using INNER JOIN using Bus_Type.
				2. The name of the passenger and distance is retrieved using WHERE clause
                   and AND operator.
				3. Hence the price for Bus_Type 'Sitting' is Rs.744 and the price for
                   Bus_Type 'Sleeper' is Rs.1320.
*/

##########################################################################################################################

 -- g. Alter the column category with the value "Non-AC" where the 
-- Bus_Type is sleeper (2 marks)

SELECT * FROM passenger;

UPDATE passenger SET Category = 'non-ac' 
WHERE Bus_Type = 'Sleeper';

/*	OBSERVATION :
				   1. UPDATE command is used to update any record inside the table according 
                      to the given condition in WHERE clause.
				   2. In this SQL query, the category column in the passenger table is 
                      changed into LOWER CASE from UPPER CASE where the Bus_type is 'Sleeper'.
				   3. The chages took place in 10 rows of the table.
*/

###########################################################################################################################

-- h. Delete an entry from the table where the passenger name is Piyush and 
-- commit this change in the database. (1 mark)

DELETE FROM passenger WHERE Passenger_name = 'Piyush';

SELECT * FROM passenger;

COMMIT;

/* 	OBSERVATION : 
				  1. DELETE command is used to delete a particular record of the table according
                     to the given condition.
				  2. This SQL query is used to delete the record of the passenger whose name is 
                     'Piyush'
				  3. Once the "COMMIT" command is executed, the changes made within the 
                     table are saved to the database, and they become visible and accessible
                     to other users or processes.
                     
*/

##############################################################################################################################

-- i. Truncate the table passenger and comment on the number of rows in the table
-- (explain if required). (1 mark)

TRUNCATE TABLE passenger;

SELECT * FROM passenger;

/* OBSERVATION : 
				1. The "TRUNCATE" statement is a DDL (Data Definition Language) command
				   used to quickly delete all the data from a table, effectively removing 
                   all rows and resetting the table to its original state. 
                2. Once TRUNCATE command is executed, the data in the table is permanently
				   deleted.
				3. TRUNCATE command delete the entries from the table and the structure of the
                   table will remain the same.
				4. After the TRUNCATE command is executed, if we display the records from the table
                   it returns NULL values in all the columns.`
*/


##################################################################################################################################

-- j. Delete the table passenger from the database. (1 mark)

DROP TABLE passenger;

SHOW TABLES;

/*  OBSERVATION :
				 1. The "DROP TABLE" command is a DDL (Data Definition Language) statement and
                    cannot be rolled back.
				 2. Once DROP command is executed, the table and its data are permanently deleted.
                 3. When a table is dropped all associated objects like triggers, constraints,
				    and indexes are also removed.
                 4. The DROP command deletes the structure of the table where as TRUNCATE command
                    deletes only the records of the table.
*/

###################################################################################################################################