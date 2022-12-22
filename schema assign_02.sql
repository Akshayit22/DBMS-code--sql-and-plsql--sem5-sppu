show tables;
+---------------+
| Tables_in_kkw |
+---------------+
| dependant63   |
| dept63        |
| employees63   |
| project63     |
| works63       |
+---------------+
5 rows in set (0.00 sec)

mysql> select * from employees63;

+------------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+
| name63           | empid63 | address63   | city63   | dob63      | dojoin63   | gender63 | salary63 | deptno63 | mo_no      | age  |
+------------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+
| yashwant shirore |     101 | Dhule       | Dhule    | 2002-02-21 | 2023-02-21 | M        |    62000 |        4 | 9994445555 |   20 |
| nishant shinde   |     102 | nager-2     | Nager    | 2001-04-21 | 2023-02-21 | M        |    40000 |        3 | 9998888814 |   21 |
| rohit pagare     |     103 | panchavati  | pune     | 2000-01-11 | 2023-02-21 | M        |    60000 |        2 | 9994445555 |   18 |
| pravin raut      |     104 | panchavati_ | nashik-3 | 1990-01-31 | 2019-10-21 | M        |    35000 |        1 | 9878974656 |   30 |
| umair khan       |     105 | gangapur r  | kolkata  | 2001-01-11 | 2023-02-21 | M        |    80000 |        3 | 9998888814 |   22 |
| Akshay Telang    |     106 | peth road   | nashik   | 2002-02-11 | 2023-02-21 | M        |   100000 |        5 | 9998888814 |   20 |
| somnath p.       |     107 | kkw hostel  | nashik   | 2002-01-10 | 2023-02-21 | M        |    54000 |        6 | 9878974656 |   20 |
+------------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+


7 rows in set (0.00 sec)

mysql> select * from dept63;
+----------+-----------------+------------+----------------+
| deptno63 | name63          | location63 | managerempid63 |
+----------+-----------------+------------+----------------+
|        1 | development     | Building 1 |            101 |
|        2 | Testing         | Building 2 |            102 |
|        3 | Planning        | Building 3 |            103 |
|        4 | Service         | Building 4 |            104 |
|        5 | Administration  | Building 5 |            105 |
|        6 | computer        | Building 1 |            105 |
+----------+-----------------+------------+----------------+
6 rows in set (0.00 sec)

mysql> select * from dependant63;
+---------+------------------+------+----------+
| empid63 | name_dependant63 | age  | relation |
+---------+------------------+------+----------+
|     101 | anil             |   20 | son      |
|     103 | shubham wagh     |   16 | son      |
|     104 | umair khan       |   18 | brother  |
|     105 | somnath p.       |   18 | brother  |
|     106 | sanket shirsat   |   18 | brother  |
|     102 | anmol patil      |   15 | son      |
+---------+------------------+------+----------+
6 rows in set (0.00 sec)

mysql> select * from project63;
+-------------+------------------+----------+
| projectid63 | title63          | city63   |
+-------------+------------------+----------+
|           1 | Banking project  | pune     |
|           2 | Testing project  | pune     |
|           3 | ERP system       | nashik   |
|           4 | software mgnt    | banglore |
|           5 | secert project   | kolkata  |
+-------------+------------------+----------+
5 rows in set (0.00 sec)

mysql> select * from works63;
+---------+-------------+-----------------+
| empid63 | projectid63 | totalhrWorked63 |
+---------+-------------+-----------------+
|     105 |           5 |             344 |
|     106 |           4 |             244 |
|     107 |           3 |             124 |
|     101 |           2 |            1234 |
|     102 |           1 |             132 |
|     103 |           2 |             552 |
|     104 |           3 |            1000 |
+---------+-------------+-----------------+
7 rows in set (0.00 sec)


select avg(salary63) from employees63;
+-------------------+
| avg(salary63)     |
+-------------------+
| 61285.71428571428 |
+-------------------+

select avg(employees63.salary63) ,employees63.deptno63,dept63.name63 from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63;

+---------------------------+----------+-----------------+
| avg(employees63.salary63) | deptno63 | name63          |
+---------------------------+----------+-----------------+
|                     35000 |        1 | development     |
|                     60000 |        2 | Testing         |
|                     60000 |        3 | Planning        |
|                     62000 |        4 | Service         |
|                    100000 |        5 | Administration  |
|                     54000 |        6 | computer        |
+---------------------------+----------+-----------------+




select d.name63 from dept63 d,employees63 e where e.deptno63 = d.deptno63 and e.salary63 = min(e.salary63) ;









/*
select avg(employees63.salary63) from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63;
	
	
select e.empid63 from employees63 e ,dept63 d where e.deptno63 = d.deptno63 and e.salary63 > select avg(employees63.salary63) ,employees63.deptno63,dept63.name63 from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63;

select e.empid63 from employees63 e ,dept63 d where e.deptno63 = d.deptno63 and d.deptno63 = e.deptno63 and e.salary63 > (select avg(employees63.salary63) from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63);



select empid63 from 


select count(employees63.empid63),employees63.deptno63 from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees
*/



