select
   cr.country_name, cr.region_name, count(e.*)
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
group by
   cr.country_name, cr.region_name






select
   cr.country_name, cr.region_name, count(e.*)
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
group by
   rollup(cr.country_name, cr.region_name)




select
   cr.country_name, cr.region_name, count(e.*)
from
   data_sci.employees e
join
   data_sci.company_regions cr
on
   e.region_id = cr.id
group by
   rollup(cr.country_name, cr.region_name)
order by
   cr.country_name, cr.region_name