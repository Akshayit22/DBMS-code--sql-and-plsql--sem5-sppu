/************** TE-B-73 Akshay Telang *******************/
/************** ASSIGNMENT 07 CURSOR  *******************/

create table o_rollcall(
	roll_no int,
	name varchar(20),
	address varchar(20)
);
create table n_rollcall(
	roll_no int,
	name varchar(20),
	address varchar(20)
);

insert into n_rollcall values (3,'Akshay','nashik');

insert into o_rollcall values (1,'Rohit','Rohit');
insert into o_rollcall values (2,'Ishan','MP');

insert into o_rollcall values (3,'Akshay','nashik');

insert into o_rollcall values (4,'Anmol','Nashik');
insert into o_rollcall values (5,'Kalpesh','Dhule');
insert into o_rollcall values (6,'Abhi','Satara');
insert into o_rollcall values (7,'Patil','Kolhapur');


set serveroutput on;
DECLARE 
	cnt int;
	c_ROLL_NO        n_rollcall.roll_no%type; 
	c_NAME 	n_rollcall.name%type; 
	c_ADDRESS 	n_rollcall.ADDRESS%type; 
CURSOR merge_c IS 
		SELECT ROLL_NO, NAME, ADDRESS 
		FROM o_rollcall;
BEGIN 
	OPEN merge_c; 
LOOP
		FETCH merge_c into c_ROLL_NO,c_NAME,c_ADDRESS;
EXIT WHEN merge_c%notfound;
SELECT count(*) into cnt 
		from n_rollcall 
		where ROLL_NO=c_ROLL_NO 
			AND name=c_NAME;
IF cnt=0 then
			dbms_output.put_line('RECORD MERGED INTO NEW TABLE');
			INSERT into n_rollcall values (c_ROLL_NO, c_NAME, c_ADDRESS);
		else 
			dbms_output.put_line('RECORD ALREADY EXIST IN NEW TABLE');
		end if;	
END LOOP; 
	CLOSE merge_c; 
END; 
/

OUTPUT AFTER EXCUTING PROCEDURE: 

	RECORD MERGED INTO NEW TABLE
	RECORD MERGED INTO NEW TABLE
	RECORD ALREADY EXIST IN NEW TABLE --duplicate record not merged
	RECORD MERGED INTO NEW TABLE
	RECORD MERGED INTO NEW TABLE
	RECORD MERGED INTO NEW TABLE
	RECORD MERGED INTO NEW TABLE                                                                                                    

SQL> select * from n_rollcall;

   ROLL_NO NAME                 ADDRESS
---------- -------------------- --------------------
         1 Rohit                Mumbai
         2 Ishan                MP
         3 Akshay               Nashik
         4 Anmol                Nashik
         5 Kalpesh              Dhule
         6 Abhi                 Satara
         7 Patil                Kolhapur

7 rows selected.


/*



-- create table o_rollcall(
-- 	roll_no int,
-- 	name varchar(20),
-- 	address varchar(20)
-- );
-- create table n_rollcall(
-- 	roll_no int,
-- 	name varchar(20),
-- 	address varchar(20)
-- );

delete from n_rollcall;
delete from o_rollcall;

insert into n_rollcall values (3,'Akshay','nashik');

insert into o_rollcall values (1,'Rohit','Rohit');
insert into o_rollcall values (2,'Ishan','MP');

insert into o_rollcall values (3,'Akshay','nashik');

insert into o_rollcall values (4,'Anmol','Nashik');
insert into o_rollcall values (5,'Kalpesh','Dhule');
insert into o_rollcall values (6,'Abhi','Satara');
insert into o_rollcall values (7,'Patil','Kolhapur');

select * from n_rollcall;

select * from o_rollcall;

-- set serveroutput on;
DECLARE 
	cnt int;
	c_ROLL_NO       n_rollcall.roll_no%type; 
	c_NAME 	        n_rollcall.name%type; 
	c_ADDRESS 	    n_rollcall.ADDRESS%type; 
	
    CURSOR merge_c IS 
		SELECT ROLL_NO, NAME, ADDRESS 
		FROM o_rollcall;
BEGIN 
	OPEN merge_c; 
LOOP
		FETCH merge_c into c_ROLL_NO,c_NAME,c_ADDRESS;
EXIT WHEN merge_c%notfound;
SELECT count(*) into cnt 
		from n_rollcall 
		where ROLL_NO=c_ROLL_NO 
			AND name=c_NAME;
IF cnt=0 then
			dbms_output.put_line('RECORD MERGED INTO NEW TABLE');
			INSERT into n_rollcall values (c_ROLL_NO, c_NAME, c_ADDRESS);
		else 
			dbms_output.put_line('RECORD ALREADY EXIST IN NEW TABLE');
		end if;	
END LOOP; 
	CLOSE merge_c; 
END; 
/



select * from n_rollcall;

select * from o_rollcall;


*/
