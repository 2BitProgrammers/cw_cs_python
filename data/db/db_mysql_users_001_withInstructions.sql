/*
Run MySQL database within docker.  See instructions on:  https://hub.docker.com/_/mysql

To see if you have an instance of mysql which is stopped:
$ docker ps -a

If you have already run the database then you don't need to run a new instance of the container.  
You should be able to pick up where you left off:  
$ docker start mysql01

For the first time you create the instance, run a local instance (with root password of “changeme”):
$ docker run --name mysql01 -e MYSQL_ROOT_PASSWORD=changeme -p "3306:3306" -d mysql

To see if it is running:  
$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                               NAMES
d163cf833e47   mysql     "docker-entrypoint.s…"   3 seconds ago   Up 2 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql01

To connect to the database:
$ docker exec -it mysql01 /usr/bin/mysql -p
Enter password:  <enter password from above:  changeme>
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
mysql> exit;
*/


/* 
Create the database (AKA schema) which we will want to use.
NOTE: MySQL is capable of running multiple schemas at once.
*/
CREATE SCHEMA myapp1;
SHOW SCHEMAS; 

/* 
Tell database which schema/database we wish to use by default
*/
USE myapp1;


/* 
Create the users table
*/
CREATE TABLE users (
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(25) NOT NULL,
	age INT NOT NULL,
	PRIMARY KEY (id)
);

/*
Show all the tables which are a part of this schema:

+------------------+
| Tables_in_myapp1 |
+------------------+
| users            |
+------------------+
1 row in set (0.00 sec)
*/
SHOW TABLES;

/*
Give details about the users table:

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | users | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    5 |   100.00 | NULL  |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)
*/
DESCRIBE TABLE users;


INSERT INTO users VALUES(100, 'Randy', 53);
SELECT * FROM users;

INSERT INTO users
VALUES 
	(101, 'Randy2', 53),
    (102, 'Eugene', 19),
    (103, 'Lucas', 14),
    (104, 'Gene', 31)
    ;

/*
Force all transactions to be finalized and saved
*/
COMMIT;

/*
Show the contents of the users table:

SELECT * FROM users;
+-----+--------+-----+
| id  | name   | age |
+-----+--------+-----+
| 100 | Randy  |  53 |
| 101 | Randy2 |  53 |
| 102 | Eugene |  19 |
| 103 | Lucas  |  14 |
| 104 | Gene   |  31 |
+-----+--------+-----+

SELECT id, name FROM users;
+-----+--------+
| id  | name   |
+-----+--------+
| 100 | Randy  |
| 101 | Randy2 |
| 102 | Eugene |
| 103 | Lucas  |
| 104 | Gene   |
+-----+--------+

SELECT id, name FROM users WHERE name LIKE '%ene%';
+-----+--------+
| id  | name   |
+-----+--------+
| 102 | Eugene |
| 104 | Gene   |
+-----+--------+

SELECT id, name FROM users WHERE name LIKE '%ene%' ORDER BY name DESC;
+-----+--------+
| id  | name   |
+-----+--------+
| 104 | Gene   |
| 102 | Eugene |
+-----+--------+
*/
SELECT * FROM users;
SELECT id, name FROM users;
SELECT id, name FROM users WHERE name LIKE '%ene%';
SELECT id, name FROM users WHERE name LIKE '%ene%' ORDER BY name DESC;

/*

Let's change 'Randy2' to 'Ken'.  After changes, you should see:

SELECT * FROM users;
+-----+--------+-----+
| id  | name   | age |
+-----+--------+-----+
| 100 | Randy  |  53 |
| 101 | Ken    |  55 |
| 102 | Eugene |  19 |
| 103 | Lucas  |  14 |
| 104 | Gene   |  31 |
+-----+--------+-----+
*/
UPDATE users
    SET name='Ken', age=55
    WHERE id=101
    ;
COMMIT;
SELECT * FROM users;

/*
To exit out of mysql command line tool (and docker exec command)
*/
exit;

/* 
To stop the docker container:
    $  docker stop mysql01


To see which docker containers are running:
    $ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES


To start the container again, run:
    $ docker start mysql01

*/