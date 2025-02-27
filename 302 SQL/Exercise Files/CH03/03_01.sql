select
  *
from
  data_sci.company_departments






select
  upper(department_name)
from
  data_sci.company_departments




select
  initcap(department_name)
from
  data_sci.company_departments




select
  lower(initcap(department_name))
from
  data_sci.company_departments






select
  ‘ kelly’


select
  ‘ kelly’ = ‘kelly’




select
  ltrim(‘ kelly’)




select
  ltrim(‘ kelly’) = ‘kelly’




select
  ltrim(‘ kelly  ’) = ‘kelly’






select
  rtrim(ltrim(‘ kelly  ’)) = ‘kelly’




select
   job_title || last_name
from
  data_sci.employees


select
   job_title || ‘-’ || last_name
from
  data_sci.employees






select
   job_title || ‘-’ || null
from
  data_sci.employees




select
   concat(job_title, ‘-’,last_name)
from
  data_sci.employees






select
   concat(job_title, ‘-’,null)
from
  data_sci.employees


select
   concat_ws(‘-’, job_title, last_name)
from
  data_sci.employees


select
   concat_ws(‘-’, job_title, last_name,email)
from
  data_sci.employees