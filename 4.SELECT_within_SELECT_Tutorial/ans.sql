# 1
SELECT name
FROM world
WHERE population >
   (SELECT population
    FROM world
    WHERE name='Russia')

# 2
SELECT name
FROM world
WHERE continent = 'Europe'
AND
gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom')

# 3
SELECT name, continent
FROM world
WHERE
  continent IN (
    SELECT continent
    FROM world
    WHERE
      name IN ('Argentina','Australia')
    )
ORDER BY name;

# 4
SELECT name, population
FROM world
WHERE
  population > (SELECT population FROM world WHERE name = 'Canada')
AND
  population < (SELECT population FROM world WHERE name = 'Poland');

# 5
SELECT name, CONCAT(
  ROUND(population/(SELECT population FROM world WHERE name='Germany')*100, 0),
  '%')
FROM world
WHERE continent = 'Europe';

# 6
# Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE
  gdp > ALL(
    SELECT gdp
    FROM world
    WHERE
      continent = 'Europe'
      AND
      gdp > 0
    );

# 7
SELECT continent, name, area
FROM world x
WHERE area = 
  (SELECT max(area)
   FROM world y
   WHERE
     y.continent = x.continent
   AND
     area>0);

# 8
SELECT continent, name
FROM world x
WHERE
name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);

SELECT continent, min(name) FROM world
GROUP BY continent

# 9
SELECT name, continent, population
FROM world
WHERE continent IN (
  SELECT continent FROM world x WHERE 25000000 >= (
    SELECT MAX(population) FROM world y WHERE x.continent = y.continent)
  );

# 10
SELECT name,continent
FROM world x
WHERE population > ALL(
  SELECT 3*population
  FROM world y
  WHERE
    x.continent=y.continent
  AND
    population>0
  AND
    x.name<>y.name);