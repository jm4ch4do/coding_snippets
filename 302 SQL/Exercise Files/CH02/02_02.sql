
--- Basic Aggregation Commands

select
   *
from 
   data_sci.employees;

select
   *
from 
   data_sci.employees
limit 10;

select
   *
from 
   data_sci.employees
where
   region_id = 2;



select
   count(*)
from 
   data_sci.employees;



select
   count(*), min(salary), max(salary)
from 
   data_sci.employees;
  

select
   count(*), min(salary), max(salary)
from 
   data_sci.employees
where   
   region_id = 2;


select
   count(*), min(id), max(id)
from 
   data_sci.employees;






