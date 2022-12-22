/************** TE-B-73 Akshay Telang *******************/
/************** ASSIGNMENT 08 TRIGGER *******************/

-- Initially create table for student marks
create table Stud_Marks(
    STUD_NAME varchar2(20),
    TOTAL_MARKS number(5)
);

-- Result table
create table Result(
    STUD_NAME varchar2(20),
    ROLL_NO number(5),
    CLASS varchar2(20)
);
INSERT INTO Stud_Marks VALUES('akshay',1234);
INSERT INTO Stud_Marks VALUES('ram',700);
INSERT INTO Stud_Marks VALUES('sunil',955);
INSERT INTO Stud_Marks VALUES('anil',888);

--Creating a stored procedure
create or replace PROCEDURE PROC_GRADE1 AS

BEGIN
	FOR i IN (SELECT * FROM Stud_Marks)
	LOOP
		DBMS_OUTPUT.PUT_LINE('Student Name: ' || i.Stud_Name || '	 Student Marks: ' || i.Total_Marks);
		IF i.Total_Marks <=1500 AND i.Total_Marks >=990 THEN
			INSERT INTO Result (STUD_NAME,CLASS) VALUES (i.Stud_Name,'Distinction');
		ELSIF i.Total_Marks <=989 AND i.Total_Marks >=900 THEN
			INSERT INTO Result (STUD_NAME,CLASS) VALUES (i.Stud_Name,'First Class');
		ELSIF i.Total_Marks <=825 AND i.Total_Marks >=899 THEN
			INSERT INTO Result (STUD_NAME,CLASS) VALUES (i.Stud_Name,'Higher Second Class');
		ELSE  
			INSERT INTO Result (STUD_NAME,CLASS) VALUES (i.Stud_Name,'Marks lower than 825');
		END IF;
	END LOOP;
	COMMIT;
END;

--CALLING PROCEDURE
EXECUTE PROC_GRADE;
select * from Stud_Marks;
select * from Result;


OUTPUT : 
	Statement processed.
	
	Student Name: akshay 	Student Marks: 1234
	Student Name: ram 	Student Marks: 700
	Student Name: sunil 	Student Marks: 955
	Student Name: anil 	Student Marks: 88

	Result Set 14
	--STUD_MARKS TABLE
	STUD_NAME	TOTAL_MARKS
	akshay	1234
	ram		700
	sunil		955
	anil		88

	4 rows selected.
	Result Set 15
	
	--RESULT TABLE
	STUD_NAME	GRAD
	akshay	Distinction
	ram		Lower than 825
	sunil		First Class
	anil		Lower than 825

	4 rows selected.
