mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.01 sec)


mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE payroll_service;
Database changed
mysql> CREATE TABLE employee_payroll(
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO employee_payroll (name, salary, start) VALUES
    -> ('Vanshika' , 100000 , '2025-06-15'),
    -> ('Harshit' , 124197 , '2025-09-19'),
    -> ('Divyansh' , 156287 , '2025-01-06');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Vanshika | 100000 | 2025-06-15 |
|  2 | Harshit  | 124197 | 2025-09-19 |
|  3 | Divyansh | 156287 | 2025-01-06 |
+----+----------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT salary FROM employee_payroll WHERE name = 'Vanshika';
+--------+
| salary |
+--------+
| 100000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2025-06-30' AS DATE) AND DATE(NOW());
Empty set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2024-06-30' AS DATE) AND DATE(NOW());
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  3 | Divyansh | 156287 | 2025-01-06 |
+----+----------+--------+------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Harshit' or name = 'Divyansh';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'F' WHERE name = 'Vanshika';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+----------+--------+--------+------------+
| id | name     | gender | salary | start      |
+----+----------+--------+--------+------------+
|  1 | Vanshika | F      | 100000 | 2025-06-15 |
|  2 | Harshit  | M      | 124197 | 2025-09-19 |
|  3 | Divyansh | M      | 156287 | 2025-01-06 |
+----+----------+--------+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->     gender,
    ->     SUM(salary) AS total_salary,
    ->     AVG(salary) AS average_salary,
    ->     MIN(salary) AS minimum_salary,
    ->     MAX(salary) AS maximum_salary,
    ->     COUNT(*) AS employee_count
    -> FROM employee_payroll
    -> GROUP BY gender;
+--------+--------------+----------------+----------------+----------------+----------------+
| gender | total_salary | average_salary | minimum_salary | maximum_salary | employee_count |
+--------+--------------+----------------+----------------+----------------+----------------+
| F      |       100000 |         100000 |         100000 |         100000 |              1 |
| M      |       280484 |         140242 |         124197 |         156287 |              2 |
+--------+--------------+----------------+----------------+----------------+----------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE employee_payroll ADD (PhoneNO int(10), Address varchar(255), Department varchar(255));  
Query OK, 0 rows affected, 1 warning (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from employee_payroll;
+----+----------+--------+--------+------------+---------+---------+------------+
| id | name     | gender | salary | start      | PhoneNO | Address | Department |
+----+----------+--------+--------+------------+---------+---------+------------+
|  1 | Vanshika | F      | 100000 | 2025-06-15 |    NULL | NULL    | NULL       |
|  2 | Harshit  | M      | 124197 | 2025-09-19 |    NULL | NULL    | NULL       |
|  3 | Divyansh | M      | 156287 | 2025-01-06 |    NULL | NULL    | NULL       |
+----+----------+--------+--------+------------+---------+---------+------------+


3 rows in set (0.11 sec)

mysql> ALTER TABLE employee_payroll ADD (BasicPay double, Deductions double, TexablePay double, IncomeTax double, NetPay double);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO employee_payroll (id, name, salary, startDate, gender, PhoneNO, Address, Department)
    -> VALUES
    -> (4, 'Terissa', 60000, '2020-05-21', 'F', '123345', 'Silvia', 'Sales'),
    -> (5, 'Terissa', 60000, '2020-05-21', 'F', '123345', 'Silvia', 'Marketing');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll
    -> ;
+------+----------+--------+------------+--------+---------+---------+------------+----------+------------+------------+-----------+--------+
| id   | Name     | Salary | StartDate  | Gender | PhoneNO | Address | Department | BasicPay | Deductions | TexablePay | IncomeTax | NetPay |
+------+----------+--------+------------+--------+---------+---------+------------+----------+------------+------------+-----------+--------+
|    1 | Vanshika | 100000 | 2025-06-15 | F      |    NULL | NULL    | NULL       |     NULL |       NULL |       NULL |      NULL |   NULL |
|    2 | Harshit  | 124197 | 2025-09-19 | M      |    NULL | NULL    | NULL       |     NULL |       NULL |       NULL |      NULL |   NULL |
|    3 | Divyansh | 156287 | 2025-01-06 | M      |    NULL | NULL    | NULL       |     NULL |       NULL |       NULL |      NULL |   NULL |
|    4 | Terissa  |  60000 | 2020-05-21 | F      |  123345 | Silvia  | Sales      |     NULL |       NULL |       NULL |      NULL |   NULL |
|    5 | Terissa  |  60000 | 2020-05-21 | F      |  123345 | Silvia  | Marketing  |     NULL |       NULL |       NULL |      NULL |   NULL |
+------+----------+--------+------------+--------+---------+---------+------------+----------+------------+------------+-----------+--------+
5 rows in set (0.00 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.04 sec)

mysql> Terminal close -- exit!


