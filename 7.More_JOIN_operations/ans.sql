# 1
SELECT id, title
FROM movie
WHERE yr = 1962;

# 2
SELECT yr
FROM movie
WHERE title='Citizen Kane';

# 3
SELECT id, title, yr
FROM movie
WHERE
title LIKE '%Star Trek%'
ORDER BY yr;

# 4
SELECT id
FROM actor
WHERE name = 'Glenn Close';

# 5
SELECT id
FROM movie
WHERE title = 'Casablanca';

# 6
SELECT actor.name
FROM casting INNER JOIN actor ON casting.actorid = actor.id
WHERE casting.movieid = 11768;

# 7
SELECT actor.name
FROM movie INNER JOIN (casting INNER JOIN actor ON casting.actorid = actor.id) ON movie.id = casting.movieid
WHERE
movie.title = 'Alien';

SELECT actor.name
FROM actor JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid=(SELECT id FROM movie WHERE title='Alien');

# 8
SELECT movie.title
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE casting.actorid = (SELECT id FROM actor WHERE name='Harrison Ford');

# 9
SELECT movie.title
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE
casting.actorid = (SELECT id FROM actor WHERE name='Harrison Ford')
AND
casting.ord <> 1;

# 10
SELECT movie.title, actor.name
FROM movie INNER JOIN (casting INNER JOIN actor ON casting.actorid = actor.id) ON movie.id = casting.movieid
WHERE
movie.yr = '1962'
AND
casting.ord = 1;

# 11
SELECT yr, COUNT(title)
FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
ORDER BY COUNT(title) DESC;

# 12
SELECT movie.title, actor.name
FROM movie INNER JOIN (casting INNER JOIN actor ON casting.actorid = actor.id) ON movie.id = casting.movieid
WHERE casting.ord = 1
AND
casting.movieid IN (
  SELECT movieid
  FROM actor JOIN casting ON actor.id = casting.actorid
  WHERE actor.name = 'Julie Andrews');

# 13
SELECT DISTINCT actor.name
FROM actor
  JOIN casting ON actor.id = casting.actorid
WHERE actorid IN (
  SELECT actorid FROM casting
  WHERE ord = 1
  GROUP BY actorid
  HAVING COUNT(actorid) >= 15
)
ORDER BY actor.name;

# 14
SELECT movie.title, COUNT(casting.actorid)
FROM movie
  JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title ;

# 15
SELECT actor.name
FROM actor
  JOIN casting ON actor.id = casting.actorid
WHERE
casting.movieid IN (
  SELECT casting.movieid
  FROM actor
    JOIN casting ON actor.id = casting.actorid
  WHERE actor.name = 'Art Garfunkel'
)
AND
actor.name <> 'Art Garfunkel';

