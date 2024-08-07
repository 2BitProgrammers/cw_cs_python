/*
Change to your home directory:   cd ~
Create/Load the SQLite3 database:   sqlite3 myapp1.db

Show the databases that exist:
sqlite>  .databases
main: C:\Users\rbala\myapp1.db r/w

*/



/*
Create the npc damage types.  
NOTE: you will need to do this first because the actions table will rely on 
      the data within it to limit what data can be added to itself.
*/
CREATE TABLE npcDamageTypes (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(25) NOT NULL
	);

INSERT INTO npcDamageTypes VALUES (1, 'Physical');

INSERT INTO npcDamageTypes VALUES 
    (2, 'Earth'),
    (3, 'Wind'),
    (4, 'Water'),
    (5, 'Fire'),
    (6, 'Metal'),
    (7, 'Electric'),
    (8, 'Acid')
    ;

/*
Show the data contained in the npcDamageTypes table:

1|Physical
2|Earth
3|Wind
4|Water
5|Fire
6|Metal
7|Electric
8|Acid
*/
SELECT * FROM npcDamageTypes;


/* 
Create the npc actions table
*/
CREATE TABLE npcActions ( 
    id ID PRIMARY KEY NOT NULL, 
    name VARCHAR(30) NOT NULL, 
    damageTypeId INT NOT NULL,
    attackPower INT, 
    CONSTRAINT FK_damageTypeId FOREIGN KEY (damageTypeId) REFERENCES npcDamageTypes(id)
    );


/*
Show the existing tables:

npcActions      
npcDamageTypes
*/
.tables


/*
By default, foreign key constraints are turned off.  You must turn on by: 
    PRAGMA foreign_keys;
    0
    PRAGMA foreign_keys = ON;
    PRAGMA foreign_keys;
    1
*/
PRAGMA foreign_keys = ON;
PRAGMA foreign_keys;



/*
This will fail because there is not a valid value in npcDamageTypes table. 
Since there is no id value of 100 in the npcDamageTypes table, you will get a 
failure when you try do the insert:
    Runtime error: UNIQUE constraint failed: actions.id (19)
*/
INSERT INTO npcActions VALUES (1, 'Punch', 100, 3);


/* 
Since these have a valid value (from npcDamageTypes table), they will insert just fine.
*/
INSERT INTO npcActions VALUES (1, 'Punch', 1, 3);
INSERT INTO npcActions VALUES 
    (2, 'Kick', 1, 5),
    (3, 'Flying Elbow', 1, 7),
    (4, 'Dragon Breath', 5, 22),
    (5, 'Water Drip', 4, 5),
    (6, 'Water Spout', 4, 10),
    (7, 'Water Fountain', 4, 15),
    (8, 'Razor Cut', 6, 12)
    ;


/*
Show the data contained within the npcActions table:

1|Punch|1|3
2|Kick|1|5
3|Flying Elbow|1|7
4|Dragon Breath|5|22
5|Water Drip|4|5
6|Water Spout|4|10
7|Water Fountain|4|15
8|Razor Cut|6|12
*/
SELECT * FROM npcActions;

/*
Show the abilities ordered by name:

SELECT * FROM npcActions ORDER BY name;
SELECT * FROM npcActions ORDER BY name ASC;
    4|Dragon Breath|5|22
    3|Flying Elbow|1|7
    2|Kick|1|5
    1|Punch|1|3
    8|Razor Cut|6|12
    5|Water Drip|4|5
    7|Water Fountain|4|15
    6|Water Spout|4|10

SELECT * FROM npcActions ORDER BY name DESC;
    6|Water Spout|4|10
    7|Water Fountain|4|15
    5|Water Drip|4|5
    8|Razor Cut|6|12
    1|Punch|1|3
    2|Kick|1|5
    3|Flying Elbow|1|7
    4|Dragon Breath|5|22
*/
SELECT * FROM npcActions ORDER BY name;
SELECT * FROM npcActions ORDER BY name ASC;
SELECT * FROM npcActions ORDER BY name DESC;


/*
Show the data contained within the npcActions table.
Show npc damage types (names) along with data:

1|Punch|Physical|3
2|Kick|Physical|5
3|Flying Elbow|Physical|7
4|Dragon Breath|Fire|22
5|Water Drip|Water|5
6|Water Spout|Water|10
7|Water Fountain|Water|15
8|Razor Cut|Metal|12
*/
SELECT A.id, A.name, B.name, A.attackPower
FROM npcActions AS A
INNER JOIN npcDamageTypes AS B
ON A.damageTypeId = B.id;


/* 
Show the npc actions which are water based:

5|Water Drip|4|5
6|Water Spout|4|10
7|Water Fountain|4|15
*/
SELECT * FROM npcActions WHERE damageTypeId = 4;


/*
Exit out of the SQLite3 app
*/
.quit



/*
Show that the database file has some content in it (by file size)

$ ls -l ~/myapp1.db


    Directory: C:\Users\rbala


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/30/2024  10:30 PM          20480 myapp1.db
*/


/*
To see what SQL commands you would need to run to get your SQLite3 db to its 
current state:   
    $ cd ~
    $ sqlite3 myapp1.db .dump

PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
CREATE TABLE npcDamageTypes (
id INT PRIMARY KEY NOT NULL,
name VARCHAR(25) NOT NULL
);
INSERT INTO npcDamageTypes VALUES(1,'Physical');
INSERT INTO npcDamageTypes VALUES(2,'Earth');
INSERT INTO npcDamageTypes VALUES(3,'Wind');
INSERT INTO npcDamageTypes VALUES(4,'Water');
INSERT INTO npcDamageTypes VALUES(5,'Fire');
INSERT INTO npcDamageTypes VALUES(6,'Metal');
INSERT INTO npcDamageTypes VALUES(7,'Electric');
INSERT INTO npcDamageTypes VALUES(8,'Acid');
CREATE TABLE npcActions (
    id ID PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL,
    damageTypeId INT NOT NULL,
    attackPower INT,
    CONSTRAINT FK_damageTypeId FOREIGN KEY (damageTypeId) REFERENCES npcDamageTypes(id)
    );
INSERT INTO npcActions VALUES(1,'Punch',1,3);
INSERT INTO npcActions VALUES(2,'Kick',1,5);
INSERT INTO npcActions VALUES(3,'Flying Elbow',1,7);
INSERT INTO npcActions VALUES(4,'Dragon Breath',5,22);
INSERT INTO npcActions VALUES(5,'Water Drip',4,5);
INSERT INTO npcActions VALUES(6,'Water Spout',4,10);
INSERT INTO npcActions VALUES(7,'Water Fountain',4,15);
INSERT INTO npcActions VALUES(8,'Razor Cut',6,12);
COMMIT;
*/


/*

To dump the SQL commands to a file:
    $ cd ~
    $ sqlite3 myapp1.db .dump > myapp1.sql
*/

