select
   department_id,
   salary,
   avg(salary) over (partition by department_id)
from
   data_sci.employees;


select
   department_id,
   salary,
   ntile(4) over (partition by department_id order by salary desc) as quartile
from
   data_sci.employees;




select
   department_id,
   last_name,
   salary,
   nth_value(salary,5) OVER (partition by department_id order by salary desc)
from
   data_sci.employees;