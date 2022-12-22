/************** TE-B-73 Akshay Telang *******************/
/************** ASSIGNMENT 08 TRIGGER *******************/
CREATE TABLE lib (
    idx int, book_id VARCHAR2(20),
    title VARCHAR2(50), price int
);
CREATE TABLE lib_audit (
    idx int, status varchar2(20),
    book_id VARCHAR2(20), title VARCHAR2(50),
    price int
);
insert into lib values (2,'102','cns',210);
insert into lib values (3,'103','spos',220);
insert into lib values (4,'104','toc',230);
insert into lib values (5,'102','cns',210);

/************** TRIGGER *******************/

CREATE OR REPLACE TRIGGER lib_trigger
BEFORE DELETE OR UPDATE or INSERT
ON lib 
FOR EACH ROW 

DECLARE 
	operation varchar2(20);
	--insert into lib_audit values(:old.idx , st , :old.book_id, :old.title, :old.price);
BEGIN 
    
	if updating then  
	  operation:='update'; 
	  insert into lib_audit values(:old.idx , operation , :old.book_id, :old.title, :old.price);
	  dbms_output.put_line('record updated');
	end if;

	if deleting then  
	  operation :='Delete';
	  insert into lib_audit values(:old.idx , operation , :old.book_id, :old.title, :old.price);
	  dbms_output.put_line('record deleted');
	end if;

	if inserting then
	  dbms_output.put_line('record inserted');
	end if;
    	
END; 
/

/************** QUERY EXAMPLE 1 *******************/
select * from lib;
select * from lib_audit;
	LIB TABLE : 

		IDX	BOOK_ID	TITLE		PRICE
		1	101		DBMS		200
		2	102		cns		210
		3	103		spos		220
		4	104		toc		230
		5	105		IOT		250
	4 rows selected.

	LIB_AUDIT TABLE : 
		no data found

/************** QUERY EXAMPLE 2 *******************/

QUERY : delete from lib;  

	1 row(s) inserted.
	9 row(s) deleted.
	records deleted

	LIB TABLE :
		no data found
		Result Set 10
		
	LIB_AUDIT TABLE : 

		IDX	STATUS	BOOK_ID	TITLE	PRICE
		2	Delete	102	cns	210
		3	Delete	103	spos	220
		4	Delete	104	toc	230
		1	Delete	101	DBMS	200
		5	Delete	102	cns	210
	9 rows selected.

/************** QUERY EXAMPLE 3 *******************/
QUERY : delete from lib where idx=4; 

	1 row(s) deleted.
	record deleted

	LIB_AUDIT TABLE :

		IDX	BOOK_ID	TITLE	PRICE
		1	101	DBMS	200
		2	102	cns	210
		3	103	spos	220
		5	102	cns	210

	4 rows selected.
	Result Set 15

	LIB_AUDIT TABLE : 
		IDX	STATUS	BOOK_ID	TITLE	PRICE
		4	Delete	104	toc	230

