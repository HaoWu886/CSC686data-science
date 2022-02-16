use ids18db;

desc USArrests;
set SQL_SAFE_UPDATES = 0;
select @avg_assault := avg(assault) from USArrests;
update USArrests set Assault = @avg_assault where assault = 0;
select min(murder), min(assault), min(UrbanPop) from USArrests;
select max(murder), max(assault), max(UrbanPop) from USArrests;
select format(avg(murder),2), format(avg(assault),2), format(avg(UrbanPop),2) from USArrests;
select format(variance(murder),2), format(variance(assault),2), format(variance(UrbanPop),2) from USArrests;


select format(std(murder),2), format(std(assault),2), format(std(UrbanPop),2) from USArrests;
select state, max(murder) from USArrests;
select state, UrbanPop from USArrests order by UrbanPop asc;
select state from USArrests where murder > (select murder from USArrests where state ='Arizona');
select * from USArrests;







