use world;

-- Fetch all the records from country table
SELECT * FROM Country;

-- Fetch Name, Continent, Population from the country table
SELECT Name, Continent, Population FROM Country;

-- Fetch unique region from Country table
SELECT DISTINCT REGION FROM Country;

-- Fetch all the records where population is > 100000000
SELECT * FROM Country
WHERE population > 100000000;

-- Fetch all the records where Life Expectancy is > 70.5
SELECT * FROM Country
WHERE LifeExpectancy > 70.5;

-- Fetch all the records where population lies between 5Cr to 10Cr
SELECT * FROM Country
WHERE Population BETWEEN 50000000 AND 100000000;

-- Fetch all the records where Country Name contains "land" in it
-- ex-> Poland, Scotland, etc.
SELECT * FROM Country
WHERE Name like '%land%';

-- Fetch all the records where country name starts with "An"
-- ex-> Angola
SELECT * FROM Country
WHERE Name like 'An%';

-- Fetch all the records where country name ends with "dia"
-- ex-> India
SELECT * FROM Country
WHERE Name like '%dia';

-- Fetch all the records for country India, Australia, Germany and France
SELECT * FROM Country
WHERE Name in ('India', 'Australia', 'Germany', 'France');

-- Fetch all the records for Europe where population is > 5Cr
SELECT * FROM Country
WHERE Continent = 'Europe' AND Population > 50000000;

-- Fetch all the records where Continent is Either Europe or 
-- population > 50Cr
SELECT * FROM Country
where Continent = 'Europe' OR Population > 500000000;

-- Fetch all the records except for Asia continent
SELECT * FROM Country
where NOT Continent = 'Asia';

-- fetch all the records from country table and sort the data population wise
-- ascending order
SELECT * FROM Country
ORDER BY Population;

-- fetch all the records from country table and sort the data population wise
-- Descending order
SELECT * FROM Country
ORDER BY Population desc;

-- Fetch all the records from Country where IndepYear is null
SELECT * FROM Country
WHERE IndepYear IS NULL;

-- Fetch all the records from Country where IndepYear is not null
SELECT * FROM Country
WHERE IndepYear IS NOT NULL;


-- Fetch top 5 populous country data
SELECT * FROM Country
ORDER BY Population desc
limit 5;

-- Fetch the minimum SurfaceArea from country table
SELECT MIN(SurfaceArea) FROM Country;

-- Fetch the maximum SurfaceArea from country table
SELECT MAX(SurfaceArea) FROM Country;

-- Count the total number or records
SELECT COUNT(*) FROM Country;

-- Calculate the total population of the coutries
SELECT SUM(Population) FROM Country;

-- Calculate the Average population of the coutries
SELECT AVG(Population) as Average_of_Population FROM Country;

-- Alias Name
SELECT cnt.Name, cnt.population FROM COUNTRY as cnt;


use world;
select cnt.code, cnt.Name, cnt.Continent, cnt.Population, cl.language 
from country as cnt
left join countrylanguage as cl on cl.Countrycode = cnt.code;

use neobanks;
select * from region;

select cst.Cust_name, cst.region_id, cst.balance, cst.age, r.region_name
from customer cst
inner join region r on r.region_id = cst.region_id;

-- Show the Total population of each continent
use world;

select continent, sum(population) as Total_Population 
from country
group by continent;


-- Fetch the average lifeexpactancy for each Region
select Region, AVG(LifeExpectancy) as Avg_LE
from country
group by region;

-- Fetch the maximaum and minimum surface area for each Region
select region, max(SurfaceArea) as MAX_SA, min(SurfaceArea) as MIN_SA
from country
group by region;


-- Fetch all the regions which have more than 15 countries
select region, count(code) as Total_Country
from country
group by region
having count(code) >= 15;

-- other way
select region, count(code) as Total_Country
from country
group by region
having Total_Country >= 15;


-- FetFetch all the regions having total population more than 100Cr4
select region, sum(Population) as total_population
from country
group by region
having sum(population) >= 1000000000;


-- Fetch all the regions having more than 10 countries and sort highest first
select region, count(code) as Total_Country
from country
group by region
having count(code) > 10
order by count(code) desc;

-- other way
select region, count(code) as Total_Country
from country
group by region
having Total_Country > 10
order by Total_Country desc;

-- rank the continent based on their population
select 
distinct Continent,
case 
	when continent = 'Asia' then 1
	when continent = 'Africa' then 2
	when continent = 'Europe' then 3
	when continent = 'North America' then 4
	when continent = 'South America' then 5
	when continent = 'Oceania' then 6
	when continent = 'Antarctica' then 7
	else 0
end as Ranking
from country
order by ranking;



