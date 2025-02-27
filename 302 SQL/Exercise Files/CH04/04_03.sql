select
   round(avg(salary), 2)
from
   data_sci.employees 






select
   round(avg(e1.salary), 2)
from
   (select * from data_sci.employees         where salary > 100000) e1




select
   round(avg(e1.salary), 2)
from
   data_sci.employees e1
where
   salary > 100000