select
  department_id, sum(salary)
from 
   data_sci.employees 
group by 
   department_id
having
   sum(salary) > 5000000
order by
   sum(salary) desc
   