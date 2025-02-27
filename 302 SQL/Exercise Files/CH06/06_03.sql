drop table if exists data_sci.org_structure;
create table data_sci.org_structure (
    id integer,
    department_name text,
    parent_department_id integer);


insert into data_sci.org_structure values
  (1, 'CEO Office', null),
  (2, 'VP Sales', 1),
  (3, 'VP Operations', 1),
  (4, 'Northeast Sales',2),
  (5, 'Northwest Sales',2),
  (6, 'Infrastructure Operations', 3),
  (7, 'Management Operations', 3);