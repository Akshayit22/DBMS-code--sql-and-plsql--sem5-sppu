 select employees63.name63 , dob63 , empid63 , dept63.name63  from employees63 , dept63 where month(dob63)=01 and dept63.name63="computer" and employees63.deptno63 = dept63.deptno63;
 
+------------+------------+---------+----------+
| name63     | dob63      | empid63 | name63   |
+------------+------------+---------+----------+
| somnath p. | 2002-01-10 |     107 | computer |
+------------+------------+---------+----------+




select * from employees63 where empid63 in (select empid63 from works63 where projectid63 in ( select projectid63 from project63 where title63="ERP system"));
+-------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+
| name63      | empid63 | address63   | city63   | dob63      | dojoin63   | gender63 | salary63 | deptno63 | mo_no      | age  |
+-------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+
| somnath p.  |     107 | kkw hostel  | nashik   | 2002-02-10 | 2023-02-21 | M        |    54000 |        6 | 9878974656 |   20 |
| pravin raut |     104 | panchavati_ | nashik-3 | 1990-01-31 | 2019-10-21 | M        |    50000 |        1 | 9878974656 |   30 |
+-------------+---------+-------------+----------+------------+------------+----------+----------+----------+------------+------+




select name63,city63 from employees63 where empid63 in (select empid63 from works63 where projectid63 in ( select projectid63 from project63 where title63="Banking project"));
+----------------+--------+
| name63         | city63 |
+----------------+--------+
| nishant shinde | Nager  |
+----------------+--------+


select totalhrWorked63 from works63 where projectid63 in (select projectid63 from project63 where title63="Banking project");
+-----------------+
| totalhrWorked63 |
+-----------------+
|             132 |
+-----------------+


5.  select * from employees63 where empid63 in (select empid63 from works63 where projectid63 in (select projectid63 from project63 where project63.city63 = employees63.city63));
+--------------+---------+------------+---------+------------+------------+----------+----------+----------+------------+------+
| name63       | empid63 | address63  | city63  | dob63      | dojoin63   | gender63 | salary63 | deptno63 | mo_no      | age  |
+--------------+---------+------------+---------+------------+------------+----------+----------+----------+------------+------+
| umair khan   |     105 | gangapur r | kolkata | 2001-01-11 | 2023-02-21 | M        |    40000 |        3 | 9998888814 |   22 |
| somnath p.   |     107 | kkw hostel | nashik  | 2002-01-10 | 2023-02-21 | M        |    54000 |        6 | 9878974656 |   20 |
| rohit pagare |     103 | panchavati | pune    | 2000-01-11 | 2023-02-21 | M        |    60000 |        2 | 9994445555 |   18 |
+--------------+---------+------------+---------+------------+------------+----------+----------+----------+------------+------+

7. select * from employees63 e , project63 p, works63 w where e.empid63 = w.empid63 and w.projectid63 = p.projectid63 and p.title63 != "Banking project";
===> show all column from 3 tables
or

7. select e.empid63, e.name63 ,deptno63,p.title63  from employees63 e , project63 p, works63 w where e.empid63 = w.empid63 and w.projectid63 = p.projectid63 and p.title63 != "Banking project";
+---------+------------------+----------+------------------+
| empid63 | name63           | deptno63 | title63          |
+---------+------------------+----------+------------------+
|     101 | yashwant shirore |        4 | Testing project  |
|     103 | rohit pagare     |        2 | Testing project  |
|     107 | somnath p.       |        6 | ERP system       |
|     104 | pravin raut      |        1 | ERP system       |
|     106 | Akshay Telang    |        5 | software mgnt    |
|     105 | umair khan       |        3 | secert project   |
+---------+------------------+----------+------------------+




8. select avg(employees63.salary63) ,employees63.deptno63,dept63.name63 from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63 ;
+---------------------------+----------+-----------------+
| avg(employees63.salary63) | deptno63 | name63          |
+---------------------------+----------+-----------------+
|                     50000 |        1 | development     |
|                     60000 |        2 | Testing         |
|                     40000 |        3 | Planning        |
|                     60000 |        4 | Service         |
|                     40000 |        5 | Administration  |
|                     54000 |        6 | computer        |
+---------------------------+----------+-----------------+

9. select distinct e.name63 , e.empid63 from employees63 e, project63 p , works63 w where e.salary63 > (select e.salary63 from employees63 e, project63 p , works63 w where e.empid63 = w.empid63 and w.projectid63 = p.projectid63 and p.title63 = "Banking project");

+------------------+---------+
| name63           | empid63 |
+------------------+---------+
| yashwant shirore |     101 |
| rohit pagare     |     103 |
| umair khan       |     105 |
| Akshay Telang    |     106 |
| somnath p.       |     107 |
+------------------+---------+





10 . 


select avg(employees63.salary63) ,employees63.deptno63,dept63.name63 from employees63,dept63 where dept63.deptno63 = employees63.deptno63 group by employees63.deptno63 ;










