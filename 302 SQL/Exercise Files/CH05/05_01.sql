select
   department_id,
   last_name,
   salary,
   first_value(salary) over (partition by department_id order by salary asc) first_sal
from
   data_sci.employees;
