with region_salaries as
 (select
    e.region_id,
    sum(e.salary) region_salary
  from
    data_sci.employees e
  group by region_id),
 top_region_salaries as
  (select
      region_id
   from
      region_salaries
    where region_salary > (SELECT SUM(region_salary)/7 from region_salaries))
select 
   *
from
  region_salaries
where
  region_id in (SELECT region_id from top_region_salaries)