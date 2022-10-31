------QUESTÃO 34, campeonato cearense


CREATE TABLE teams(
	id integer PRIMARY KEY,
	name varchar(50)
);

INSERT INTO teams (id,name)
VALUES 
(1,'CEARA'),
(2,'FORTALEZA'),
(3,'GUARANY DE SOBRAL'),
(4,'FLORESTA');

CREATE TABLE MATCHES(
	id integer PRIMARY KEY,
	team_1 integer REFERENCES teams(id),
	team_2 integer REFERENCES teams(id),
	team_1_goals integer,
	team_2_goals integer
);

INSERT INTO matches(id,team_1,team_2,team_1_goals,team_2_goals)
VALUES
(1,4,1,0,4),
(2,3,2,0,1),
(3,1,3,3,0),
(4,3,4,0,1),
(5,1,2,0,0),
(6,2,4,2,1);


SELECT t.name,count(t.name) AS matches,sum(victory) AS victories,sum(defeat) AS defeats,sum(draw) AS draws, (3 * sum(victory) + sum(draw)) AS score
FROM (SELECT t."name" ,
	(CASE 
		WHEN m.team_1_goals > m.team_2_goals THEN 1   
		ELSE 0 END) AS victory,
	(CASE 
		WHEN m.team_2_goals  > m.team_1_goals THEN  1
		ELSE 0 END ) AS defeat,
	(CASE 
	WHEN m.team_2_goals  = m.team_1_goals THEN  1
	ELSE 0 END ) AS draw
	FROM teams t 
	JOIN matches m 
	ON m.team_1 = t.id
UNION all
SELECT t."name" ,
	(CASE 
		WHEN m.team_1_goals < m.team_2_goals THEN 1   
		ELSE 0 END) AS victory,
	(CASE 
		WHEN m.team_2_goals  < m.team_1_goals THEN  1
		ELSE 0 END ) AS defeat,
	(CASE 
	WHEN m.team_2_goals  = m.team_1_goals THEN  1
	ELSE 0 END ) AS draw
	FROM teams t 
	JOIN matches m 
	ON m.team_2 = t.id) AS t
GROUP BY t.name
ORDER BY score desc;

	
	
DROP TABLE matches;
DROP TABLE teams;
