mysql> create database address_book
    -> ;
Query OK, 1 row affected (0.12 sec)

mysql> use address_book;
Database changed

mysql>
mysql> CREATE TABLE address_book (
    -> firstName varchar(255),
    -> lastName varchar(255),
    -> address varchar(255),
    -> city varchar(255),
    -> state varchar(255),
    -> zip int,
    -> phoneNumber int(10),
    -> email varchar(255)
    -> );
Query OK, 0 rows affected, 1 warning (0.16 sec)

mysql> INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNumber, email)
    -> VALUES
    -> ('Vanshika', 'Bhatia', 'Ganga Nagar', 'Hisar', 'Haryana', 125001, 12345678, 'vanshi@gmail.com'),
    -> ('Rahul', 'Bhatia', 'Sector26', 'Panchkula', 'Haryana', 134119, 89546711, 'rahul@yahoo.com'),
    -> ('Harshita', 'Bhatia', 'Shanti Nagar', 'Hisar', 'Haryana', 125001, 9087654, 'harshita@gmail.com');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| firstName | lastName | address       | city      | state         | zip    | phoneNumber | email              |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| Vanshika  | Bhatia   | Ganga Nagar   | Hisar     | Haryana       | 125001 | 12345678    | vanshi@gmail.com   |
| Rahul     | Bhatia   | Sector26      | Panchkula | Haryana       | 134119 | 89546711    | rahul@yahoo.com    |
| Harshita  | Bhatia   | Shanti Nagar  | Hisar     | Haryana       | 125001 | 9087654     | harshita@gmail.com |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
3 rows in set (0.02 sec)

mysql> Terminal close -- exit!

mysql> use address_book
Database changed
mysql> UPDATE address_book SET zip='100211' WHERE firstName='Vanshika';
Query OK, 1 row affected (0.12 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM address_book WHERE firstName='Harshita';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book WHERE city='Panchkula';
+-----------+----------+---------------+-----------+---------+--------+-------------+--------------------+
| firstName | lastName | address       | city      | state   | zip    | phoneNumber | email              |
+-----------+----------+---------------+-----------+---------+--------+-------------+--------------------+
| Rahul     | Bhatia   | Sector26      | Panchkula | Haryana | 134119 | 89546711    | rahul@yahoo.com    |
+-----------+----------+---------------+-----------+---------+--------+-------------+--------------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(city) FROM address_book GROUP BY city;
+-------------+
| COUNT(city) |
+-------------+
|           1 |
|           1 |
+-------------+
2 rows in set (0.01 sec)

mysql>  INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNumber, email)
    ->     -> VALUES
 ('Harshita', 'Bhatia', 'Shanti Nagar', 'Hisar', 'Haryana', 125001, 9087654, 'harshita@gmail.com')at line 2

Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book WHERE city='Hisar' ORDER BY first_name DESC;
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| firstName | lastName | address       | city      | state         | zip    | phoneNumber | email              |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+
| Vanshika  | Bhatia   | Ganga Nagar   | Hisar     | Haryana       | 125001 | 12345678    | vanshi@gmail.com   |
| Harshita  | Bhatia   | Shanti Nagar  | Hisar     | Haryana       | 125001 | 9087654     | harshita@gmail.com |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+

2 rows in set (0.01 sec)

mysql> ALTER TABLE address_book ADD COLUMN type VARCHAR(20);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE address_book SET type='friend' WHERE state='Haryana';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT type, COUNT(type) FROM address_book GROUP BY type;
+--------+-------------+
| type   | COUNT(type) |
+--------+-------------+
| friend |           3 |
| NULL   |           0 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> select * from address_book;
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+
| firstName | lastName | address       | city      | state         | zip    | phoneNumber | email              | type   |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+
| Vanshika  | Bhatia   | Ganga Nagar   | Hisar     | Haryana       | 125001 | 12345678    | vanshi@gmail.com   | friend |
| Rahul     | Bhatia   | Sector26      | Panchkula | Haryana       | 134119 | 89546711    | rahul@yahoo.com    | friend |
| Harshita  | Bhatia   | Shanti Nagar  | Hisar     | Haryana       | 125001 | 9087654     | harshita@gmail.com | friend |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+

3 rows in set (0.01 sec)

mysql> CREATE TABLE address_type(
    ->      id int NOT NULL UNIQUE AUTO_INCREMENT,
    ->      firstName VARCHAR(10),
    ->      contact_type VARCHAR(20),
    ->      primary key (id),
    ->      foreign key (firstName) REFERENCES address_book(firstName)
    -> );
ERROR 1822 (HY000): Failed to add the foreign key constraint. Missing index for constraint 'address_type_ibfk_1' in the referenced table 'address_book'

mysql> ALTER TABLE address_book
    -> ADD UNIQUE (firstName);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE address_type(
    ->      id int NOT NULL UNIQUE AUTO_INCREMENT,
    ->      firstName VARCHAR(10),
    ->      contact_type VARCHAR(20),
    ->      primary key (id),
    ->      foreign key (firstName) REFERENCES address_book(firstName)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO address_type VALUES
    -> (1, 'Vanshika', 'Family'),
    -> (2, 'Rahul', 'Friend'),
    -> (3, 'Harshita', 'Friend');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book ab LEFT JOIN address_type at ON ab.firstName = at.firstName;
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+
| firstName | lastName | address       | city      | state         | zip    | phoneNumber | email              | type   | id   | firstName | contact_type |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+
| Vanshika  | Bhatia   | Ganga Nagar   | Hisar     | Haryana       | 125001 | 12345678    | vanshi@gmail.com   | friend |    1 | Vanshika  | Family       |
| Rahul     | Bhatia   | Sector26      | Panchkula | Haryana       | 134119 | 89546711    | rahul@yahoo.com    | friend |    2 | Rahul     | Friend       |
| Harshita  | Bhatia   | Shanti Nagar  | Hisar     | Haryana       | 125001 | 9087654     | harshita@gmail.com | friend |    3 | Aman      | Friend       |
+-----------+----------+---------------+-----------+---------------+--------+-------------+--------------------+--------+------+-----------+--------------+

4 rows in set (0.01 sec)

mysql> Terminal close -- exit!