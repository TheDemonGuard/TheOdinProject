/*

Author  : Henry Naoto Ishiyama
Email   : henryishiyama@gmail.com
Date    : 2019/04/13
Version : 1.0.0

Description :
This program was developed as a part of the assignment/project for
"THE ODIN PROJECT".

Project :
SQL Zoo

Project URL :
https://www.theodinproject.com/courses/databases/lessons/sql#project-sql-zoo
https://github.com/TheOdinProject/curriculum/blob/master/databases/project_databases.md

https://sqlzoo.net/wiki/SUM_and_COUNT

*/

/*
1.
Show the total population of the world.

world(name, continent, area, population, gdp)

SELECT SUM(population)
FROM world
*/

SELECT
  sum(population)
FROM world;

/*
2.
List all the continents - just once each.
*/

SELECT
  DISTINCT continent
FROM world;

/*
3.
Give the total GDP of Africa.
*/

SELECT
  sum(gdp)
FROM world
WHERE (continent = 'Africa');

/*
4.
How many countries have an area of at least 1000000.
*/

SELECT
  count(name)
FROM world
WHERE
  (area >= 1000000);

/*
5.
What is the total population of ('Estonia', 'Latvia', 'Lithuania').
*/

SELECT
  sum(population)
FROM world
WHERE
  (name IN ('Estonia',
            'Latvia',
            'Lithuania'));

/*
6.
For each continent show the continent and number of countries.
*/

SELECT
  x.continent,
  count(x.name)
FROM world x
WHERE
  (x.continent IN ((SELECT
                      DISTINCT y.continent
                    FROM world y)))
GROUP BY x.continent;

/*
7.
For each continent show the continent and number of countries with populations of at least 10 million.
*/

SELECT
  x.continent,
  count(x.name)
FROM world x
WHERE
  (x.continent IN ((SELECT
                      DISTINCT y.continent
                    FROM world y)))
AND (x.population >= 10000000)
GROUP BY x.continent;

/*
8.
List the continents that have a total population of at least 100 million.
*/

SELECT
  x.continent
FROM world x
WHERE
  ((SELECT
      sum(y.population)
    FROM world y
    WHERE
      (x.continent = y.continent))
  >= 100000000)
GROUP BY x.continent;
