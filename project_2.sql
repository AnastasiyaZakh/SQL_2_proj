
CREATE TABLE card_games(id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_played TEXT,
    game_name TEXT,
    player_name TEXT,
    score INTEGER);


INSERT INTO card_games(date_played, game_name, player_name,score)
VALUES ('2015/01/07','Rummy','Spunky Sam',226)
, ('2015/01/07','Rummy','Marcimus',418)
, ('2015/01/07','Rummy','Winston',523)
, ('2015/01/07','Rummy','Hopper',311)
, ('2015/01/14','Go Fish','Spunky Sam',7)
, ('2015/01/14','Go Fish','Marcimus',5)
, ('2015/01/14','Go Fish','Winston',4)
, ('2015/01/14','Go Fish','Hopper',10)
, ('2015/01/14','Crazy Eights','Spunky Sam',215)
, ('2015/01/14','Crazy Eights','Marcimus',167)
, ('2015/01/14','Crazy Eights','Winston',109)
, ('2015/01/14','Crazy Eights','Hopper',192)
, ('2015/01/21','Rummy','Spunky Sam',473)
, ('2015/01/21','Rummy','Marcimus',324)
, ('2015/01/21','Rummy','Hopper',516)
, ('2015/01/28','Crazy Eights','Spunky Sam',119)
, ('2015/01/28','Crazy Eights','Marcimus',212)
, ('2015/01/28','Crazy Eights','Purple Pi',314)
, ('2015/01/28','Crazy Eights','Hopper',252)
, ('2015/02/04','Go Fish','Spunky Sam',3)
, ('2015/02/04','Go Fish','Marcimus',11)
, ('2015/02/04','Go Fish','Winston',12)
, ('2015/02/04','Go Fish','Hopper',0)
, ('2015/02/04','Pitch','Spunky Sam',17)
, ('2015/02/04','Pitch','Marcimus',22)
, ('2015/02/04','Pitch','Winston',-3)
, ('2015/02/04','Pitch','Hopper',9)
, ('2015/02/11','Rummy','Amelia',525)
, ('2015/02/11','Rummy','Marcimus',419)
, ('2015/02/11','Rummy','Winston',316)
, ('2015/02/11','Rummy','Hopper',398)
, ('2015/02/18','Crazy Eights','Spunky Sam',119)
, ('2015/02/18','Crazy Eights','Marcimus',231)
, ('2015/02/18','Crazy Eights','Winston',153)
, ('2015/02/18','Crazy Eights','Hopper',175)
, ('2015/02/25','Pitch','Spunky Sam',12)
, ('2015/02/25','Pitch','Marcimus',6)
, ('2015/02/25','Pitch','Winston',21)
, ('2015/02/25','Go Fish','Spunky Sam',6)
, ('2015/02/25','Go Fish','Marcimus',7)
, ('2015/02/25','Go Fish','Winston',13)
, ('2015/03/04','Rummy','Spunky Sam',378)
, ('2015/03/04','Rummy','Marcimus',327)
, ('2015/03/04','Rummy','Winston',413)
, ('2015/03/04','Rummy','Hopper',517)
, ('2015/03/11','Pitch','Spunky Sam',-1)
, ('2015/03/11','Pitch','Marcimus',-5)
, ('2015/03/11','Pitch','Winston',7)
, ('2015/03/11','Pitch','Hopper',22)
, ('2015/03/18','Crazy Eights','Spunky Sam',91)
, ('2015/03/18','Crazy Eights','Marcimus',153)
, ('2015/03/18','Crazy Eights','Amelia',174)
, ('2015/03/18','Crazy Eights','Mr. Pink',216)
, ('2015/03/25','Rummy','Spunky Sam',416)
, ('2015/03/25','Rummy','Marcimus',505)
, ('2015/03/25','Rummy','Winston',397);

/*
What ways are there to group the data values that don’t exist yet (using CASE)?
What interesting ways are there to filter the data (using AND/OR)?
*/

SELECT MAX(score)
FROM card_games;

SELECT AVG(score)
FROM card_games;

SELECT MIN(score)
FROM card_games;

SELECT player_name, SUM(score)
FROM card_games
GROUP BY player_name
HAVING SUM(score) >= 300;

SELECT player_name, 
    CASE
        WHEN player_name IN (SELECT player_name
                             FROM card_games
                             GROUP BY player_name
                             HAVING SUM(score) >= 300) THEN "A"
        ELSE "B"
    END AS Marks
FROM card_games
GROUP BY player_name;

SELECT date_played,
    CASE 
        WHEN SUM(score) > 20 and SUM(score) < 300 THEN "Yes"
        ELSE "No"
    END AS "If in 20 - 300"
FROM card_games
GROUP BY date_played;

