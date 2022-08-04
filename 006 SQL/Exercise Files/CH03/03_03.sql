select
  job_titles
from
  data_sci.employees


select distinct
  job_titles
from
  data_sci.employees
where
  job_title like ‘vp%’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title like ‘vp%’
or
 job_title like ‘web%’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘(vp%|web%)’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘(vp% | web%)’






select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘(vp%|web%)’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp%’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp%a’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp%a%’




select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp a%’






select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp_a%’


select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp (a|m)’


select distinct
  job_titles
from
  data_sci.employees
where
  job_title similar to ‘vp (a|m)%’