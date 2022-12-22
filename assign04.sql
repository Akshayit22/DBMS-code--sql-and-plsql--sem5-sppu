

--1-- pl-sql block programs

DECLARE  
   emp_rec employee%rowtype; 
   new_comm number(5); 
BEGIN  
   SELECT * into emp_rec  
   FROM customers  
   WHERE id = 2; 
    if emp_rec.commision = null then 
        new_comm = 500; 
    else 
        new_comm = emp_rec.commision * 1.25; 
    end if; 
    update employees set commision = new_comm where eid = emp_rec.eid; 
    
END;  


--2-- control flow statements

DECLARE 
   aa number(3) := 100; 
   
BEGIN 

   IF ( a = 10 ) THEN 
      dbms_output.put_line('Value of a is 10' ); 
      
   ELSIF ( a = 20 ) THEN 
      dbms_output.put_line('Value of a is 20' ); 
      
   ELSIF ( a = 30 ) THEN 
      dbms_output.put_line('Value of a is 30' ); 
      
   ELSE 
       dbms_output.put_line('None of the values is matching'); 
   END IF; 
   
END; 
/



--3-- execption handling in pl-sql



create table customer(
    c_id int,
    c_name varchar(33),
    c_addr varchar(44)
);
insert into customer values(1,'Aksahy','nashik');
DECLARE 
   c_id number(2); 
   c_name varchar(33); 
   c_addr varchar(44);  
   --user defined exception 
   ex_invalid_id  EXCEPTION; 
BEGIN 
    c_id := 0;
    c_name := 'akshay';
    c_addr := 'nashik';
    
   IF c_id <= 0 THEN 
      RAISE ex_invalid_id; 
   ELSE 
        insert into customer values(c_id,c_name,c_addr);
         DBMS_OUTPUT.PUT_LINE ('id: '||  c_id);
        DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name);  
        DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr); 
        DBMS_OUTPUT.PUT_LINE ('These values are inserted into customer table . ');
   END IF; 

EXCEPTION 
   WHEN ex_invalid_id THEN 
      dbms_output.put_line('ID must be greater than zero!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!');  
END; 
/

select * from customer;

/*
output = 
Statement processed.
ID must be greater than zero!

Result Set 1

C_ID	C_NAME	 C_ADDR
1	    Aksahy	 nashik
*/

