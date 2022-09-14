select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name








select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    cd.department_name




select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    count(*)




select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    count(*) desc




select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    1 desc


select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    2 desc


select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
order by 
    cd.department_name


--- this will generate an error
select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
where
    count(*) > 50
group by
   cd.department_name
order by 
    cd.department_name






select
   cd.department_name, count(*)
from
   data_sci.employees e
join
   data_sci.company_departments cd
on
   e.department_id = cd.id
group by
   cd.department_name
having
    count(*) > 50
order by 
    cd.department_name