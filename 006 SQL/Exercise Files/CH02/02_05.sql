select
   *
from
   data_sci.employees;


select
   *
from
   data_sci.employees
join
   data_sci.company_regions
on
   employees.region_id = company_regions.id




select
   e.*, cr.region_name, cr.country_name
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
select
   e.*, cr.region_name, cr.country_name
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
where
   cr.country_name = 'canada';


select
   e.last_name,
   e.email,
   e.start_date,
   e.salary,
   e.job_title,
   cr.region_name, 
   cr.country_name
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
select
   e.*, cr.region_name, cr.country_name
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
where
   cr.country_name = 'canada'
