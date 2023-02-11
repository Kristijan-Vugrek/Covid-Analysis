select * 
from Project_Covid_Data
where continent is not null
order by 2,3

--"deleting" 'iso_code' column(creating alter table without 'iso_code' column)
alter table Project_Covid_Data
drop column iso_code

--creating  death_percentage column

select location, date, total_vaccinations, 
 cast(total_deaths as int) as total_deaths_int, total_cases,
  (cast(total_deaths as int)/total_cases)*100 as death_percentage
from Project_Covid_Data
where continent is not null
order by 1,2

--creating  vaccination_percentage column

select location, date, total_cases, population,
 cast(total_deaths as int) as total_deaths_int,
  cast(total_vaccinations as bigint) as total_vaccinations_int, 
  (cast(total_vaccinations as bigint)/population)*100 as vaccination_percentage
from Project_Covid_Data
where continent is not null
order by 1,2


--vaccination, death percentege

select location, date, total_cases, population,
 cast(total_deaths as bigint) as total_deaths_int,
  cast(total_vaccinations as bigint) as total_vaccinations_int, 
   (cast(total_deaths as bigint)/total_cases)*100 as death_percentage,
    (cast(total_vaccinations as bigint)/population)*100 as vaccination_percentage
from Project_Covid_Data
where continent is not null
order by 1,2

-- Croatia only vaccination, death percentage

select location, date, total_cases, population,
 cast(total_deaths as bigint) as total_deaths_int,
  cast(total_vaccinations as bigint) as total_vaccinations_int, 
   (cast(total_vaccinations as bigint)/population)*100 as vaccination_percentage,
     (cast(total_deaths as bigint)/total_cases)*100 as death_percentage
from Project_Covid_Data
where location = 'Croatia' 
order by 2

--total deaths in Croatia 

select location, max(cast(total_deaths as int)) as total_deaths_int, max(total_cases) as total_cases
from Project_Covid_Data
where location = 'Croatia'
group by location

--global max percenteges

select location, population, 
max(total_cases) as total_cases,
 max(cast(total_deaths as bigint)) as total_deaths_int,
  max(cast(total_vaccinations as bigint)) as total_vaccinations_int, 
   max(cast(total_deaths as bigint))/max(total_cases) *100 as death_percentage,
    max((cast(total_vaccinations as bigint)/population)*100) as vaccination_percentage
from Project_Covid_Data
where continent is not null
group by location, population
order by 1