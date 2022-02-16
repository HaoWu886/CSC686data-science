 use ids18db;
 desc hw2part2;
 select * from hw2part2;
 set SQL_SAFE_UPDATES = 0;
select @avg_underfive := avg(underfive) from hw2part2;
update hw2part2 set underFive = @avg_underfive where underFive = 0 or null;

 set SQL_SAFE_UPDATES = 0;
select @avg_infant := avg(infant) from hw2part2;
update hw2part2 set infant = @avg_infant where infant = 0 or null;

 set SQL_SAFE_UPDATES = 0;
select @avg_neo := avg(Neo) from hw2part2;
update hw2part2 set Neo = @avg_Neo where Neo = 0 or null;

select * from hw2part2;

select year, infant from hw2part2 where infant = (select min(infant) from hw2part2);
select year, infant from hw2part2 where infant = (select max(infant) from hw2part2);

select year from hw2part2 where Neo > (select avg(Neo) from hw2part2);

select year, infant from hw2part2 order by infant desc;

select min(underFive), min(infant), min(Neo) from hw2part2;
select max(underFive), max(infant), max(Neo) from hw2part2;
select format(avg(underFive),2), format(avg(infant),2), format(avg(Neo),2) from hw2part2;
select format(variance(underFive),2), format(variance(infant),2), format(variance(Neo),2) from hw2part2;

select format(std(underFive),2), format(std(infant),2), format(std(Neo),2) from hw2part2;

alter table hw2part2 add column aboveFiveMortalityRate varchar(15) after Neo;

 set SQL_SAFE_UPDATES = 0;
select @avg_neo := format(avg(Neo),1) from hw2part2;
update hw2part2 set aboveFiveMortalityRate = @avg_neo where aboveFiveMortalityRate = null;

select * from hw2part2;

