select
   department_id
from
   data_sci.employees e1
where
   (select max(salary) from data_sci.employees e2) = e1.salary