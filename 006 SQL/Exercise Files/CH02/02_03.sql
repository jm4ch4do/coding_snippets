
--- Other Aggregates: Average, Variance and Standard Deviation


select
  *
from
  data_sci.employees;


select
  *
from
  data_sci.employees;
limit 10;


select
  sum(salary)
from 
  data_sci.employees;

select
  department_id, sum(salary)
from 
  data_sci.employees
group by department_id;


select
  department_id, sum(salary), avg(salary)
from 
  data_sci.employees
group by department_id;


select
  department_id, sum(salary), round(avg(salary),2)
from 
  data_sci.employees
group by department_id;

--- need pickup, variance not variable
select
  department_id, sum(salary), round(avg(salary),2), var_pop(salary)
from 
  data_sci.employees
group by department_id;

select
  department_id, sum(salary), round(avg(salary),2), var_pop(salary), stddev_pop(salary)
from 
  data_sci.employees
group by department_id;

-- pickup 68% 1 std, 95% 2 std
-- need video pickup wth round(stddev_pop(salary),2)
select
  department_id, 
  sum(salary), 
  round(avg(salary),2), 
  var_pop(salary), 
  round(stddev_pop(salary),2)
from 
  data_sci.employees
group by department_id;

