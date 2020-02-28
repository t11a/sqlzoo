# 1
SELECT matchid, player
FROM goal
WHERE
teamid = 'GER';

# 2
SELECT id, stadium, team1, team2
FROM game
WHERE
id = 1012;

# 3
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON game.id = goal.matchid
WHERE
goal.teamid = 'GER';

# 4
SELECT team1, team2, player
FROM game JOIN goal ON game.id = goal.matchid
WHERE
goal.player LIKE 'Mario%';

# 5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON goal.teamid = eteam.id
WHERE
goal.gtime <= 10;

# 6
SELECT mdate, teamname
FROM game JOIN eteam ON game.team1 = eteam.id
WHERE
eteam.coach = 'Fernando Santos';

# 7
SELECT player
FROM game JOIN goal ON game.id = goal.matchid
WHERE
game.stadium = 'National Stadium, Warsaw';

# 8
SELECT DISTINCT player
FROM game JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' or team2 = 'GER') AND teamid <> 'GER'

# 9
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.teamname;

# 10
SELECT stadium, COUNT(*)
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium;

# 11
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON game.id = goal.matchid
WHERE game.team1 = 'POL' or game.team2 = 'POL'
GROUP BY goal.matchid, game.mdate;

# 12
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid, game.mdate;

# 13
SELECT mdate,
team1,
SUM( CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM( CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON goal.matchid = game.id
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;

