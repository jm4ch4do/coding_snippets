

select
   last_name, department_id, salary
from 
   data_sci.employees
where
   last_name = 'boyd';




select
   last_name, department_id, salary
from 
   data_sci.employees
where
   last_name like 'b%';


 select
   last_name, department_id, salary
from 
   data_sci.employees
where
   last_name like 'b%d';



 select
   last_name, department_id, salary
from 
   data_sci.employees
where
   last_name like 'bo%'
or 
   salary > 100000;

 select
    sum(salary)
 from
     data_sci.employees
 where
  	 salary > 100000
 group by
    department_id;
