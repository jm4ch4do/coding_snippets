select
  department_id,
  last_name,
  salary,
  width_bucket(salary,0,150000,10)
from 
  data_sci.employees






select
  department_id,
  last_name,
  salary,
 round((cume_dist() over (order by salary desc) * 100)::numeric, 2)
from 
  data_sci.employees
order by
   salary desc