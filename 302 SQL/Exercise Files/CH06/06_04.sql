with recursive report_structure(id, department_name,parent_department_id) as
 (select id,  department_name, parent_department_id 
  from data_sci.org_structure where id = 7
 union
   select os.id, os.department_name, os.parent_department_id 
    from data_sci.org_structure os
    join report_structure rs on rs.parent_department_id = os.id
 )
 select
  *
 from report_structure




with recursive report_structure(id, department_name,parent_department_id) as
 (select id,  department_name, parent_department_id 
  from data_sci.org_structure where id = 4
 union
   select os.id, os.department_name, os.parent_department_id 
    from data_sci.org_structure os
    join report_structure rs on rs.parent_department_id = os.id
 )
 select
  *
 from report_structure