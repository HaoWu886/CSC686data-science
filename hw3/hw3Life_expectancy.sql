set SQL_SAFE_UPDATES = 0;
delete from Life_Expectancy where population =0 or null;

 set SQL_SAFE_UPDATES = 0;
select @avg_school := format(avg(Schooling),1) from Life_Expectancy;
update Life_Expectancy set Schooling = @avg_school where Schooling = 0 or null;

select count(Country) from Life_Expectancy;

select country, Adult_Mortality from Life_Expectancy where Adult_Mortality = (select max(Adult_Mortality)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
 select country, population from Life_Expectancy where population = (select min(population)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
 select country, Adult_Mortality from Life_Expectancy where Adult_Mortality = (select min(Adult_Mortality)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
  select country, GDP from Life_Expectancy where GDP = (select max(GDP)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
   select country, GDP from Life_Expectancy where GDP = (select min(GDP)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
    select country, Schooling,Year from Life_Expectancy where Schooling = (select max(Schooling)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
     select country, Schooling,Year from Life_Expectancy where Schooling = (select min(Schooling)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
      select country, Alcohol,Year from Life_Expectancy where Alcohol = (select max(Alcohol)
 from Life_Expectancy) and (Year between 2010 and 2015);
 
       select country, Life_Expectancy, population from Life_Expectancy 
       where Life_Expectancy = (select max(Life_Expectancy)from Life_Expectancy);

    select country, Alcohol,Year from Life_Expectancy where Alcohol = (select min(Alcohol)
 from Life_Expectancy) and (Year between 2010 and 2015);
