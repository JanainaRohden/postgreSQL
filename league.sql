------QUESTÃO 27, liga


CREATE TABLE league (
	POSITION integer PRIMARY KEY,
	team varchar
);
 INSERT INTO league (POSITION,team)
 VALUES 
 (1,'The Quacks Bats'),
 (2,'The Responsible Hornets'),
 (3,'The Bawdy Dolphins'),
 (4,'The Abstracted Sharks'),
 (5,'The Nervous Zebras'),
 (6,'The Oafish Owls'),
 (7,'The Unequaled Bison'),
 (8,'The Keen Kangaroos'),
 (9,'The Left Nightingales'),
 (10,'The Terrific Elks'),
 (11,'The Lumpy Frogs'),
 (12,'The Swift Buffalo'),
 (13,'The Big Chargers'),
 (14,'The Rough Robins'),
 (15,'The Silver Crocs');


 SELECT * FROM 
 (SELECT 'Podium: ' || l.team AS name
 FROM league l
 LIMIT 3) AS podium  
 UNION ALL  
 SELECT * FROM (SELECT 'Demoted: ' || l.team AS name
 FROM league l
 LIMIT 2 OFFSET 13) AS demoted;
 
 DROP TABLE league; 