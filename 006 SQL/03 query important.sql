/*........................................INSERT........................................*/
INSERT INTO company_regions (region_id, region_name, country)
VALUES (1, 'Norheast', 'USA')


/*........................................UPDATE........................................*/
UPDATE company_regions
SET country = 'United States'
WHERE country = 'USA'


/*........................................DELETE........................................*/
DELETE FROM company_regions
WHERE country = 'Canada'


/*........................................SELECT........................................*/
SELECT * FROM country_regions WHERE id IN (1, 2);


/*........................................TABLES........................................*/
CREATE TABLE staff(
    id integer,
    last_name text,
    department_name text,
    start_date date,
    PRIMARY KEY (id)
)


/*........................................INDEX........................................*/
CREATE INDEX idx_staff_last_name
    ON staff
    USING (last_name)


/*........................................VIEWS........................................*/
/* it imitates a tables but is not a table*/
CREATE VIEW staff_div AS
SELECT s.id, s.last_name, cd.company_division
FROM staff s
LEFT JOIN company_division cd
ON s.deparment = cd.department


/*........................................SCHEMAS........................................*/
/* schemas are like folder for containing tables and views*/


/*..................................AGGREGATE FUNCTIONS...................................*/
select COUNT(*), min(salary), max(salary), avg(salary),
    var_pop(salary), stddev_pop(salary)  /* variance standard deviation */
from data_sci.employees
where region_id = 2


/* standard deviation of 3500 means about 66% of salaries are around -3500 +3500 of the mean*/
/* an about 90% to 95% of salaries are about +7000 -7000 */
/* this assumes normal distribution for salaries */

/*................................SALARIES PER DEPARTMENT.................................*/
select cd.id, cd.department_name, sum(e.salary) as total_spent, round(avg(e.salary), 2) as avg_spent, count(*) as workers
from data_sci.employees e
join data_sci.company_departments cd
on e.department_id = cd.id
group by cd.id
order by avg(e.salary) DESC


/*................................USING STRING MATCH.................................*/
select last_name, department_id, salary
from data_sci.employees
where last_name like 'b%d'  # b and anything else, and ends with d
and salary > 100000



/*......................................JOIN.......................................*/
SELECT e.*, cr.region_name, cr.country_name
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
WHERE cr.country_name = 'canada'



/*......................................HAVING.......................................*/
-- having allow us to filter for the field being aggregated. It's used after the GROUP BY
SELECT company, SUM(sales)
FROM finance_table
WHERE company != 'Google'  -- filtering without AGG
GROUP BY company
HAVING SUM(sales) > 1000  -- filtering value beign AGG


SELECT cd.department_name, count(*)
FROM data_sci.employees e
JOIN data_sci.company_departments cd
ON e.deparment_id = cd.id
GROUP BY cd.department_name
HAVING count(*) > 50
ORDER BY cd.department_name


/*.............................SELECT IN MULTIPLE PLACES..............................*/
/* ----- SELECT WITHIN SELECT ----- */
/* get the worker's salary and the avg salary in his department */
SELECT e1.last_name, e1.salary, e1.department_id,
    ( SELECT ROUND(AVG(e2.salary), 2) 
      FROM data_sci.employees e2 
      WHERE e1.department_id = e2.department_id
    )
FROM data_sci.employees e1

/* ----- SELECT WITHIN FROM ----- */
SELECT ROUND(AVG(e1.salary), 2)
FROM (
    SELECT * 
    FROM data_sci.employees
    WHERE salary > 100000 
) e1

/* ----- SELECT WITHIN WHERE ----- */
/* Department with the worker with the higher salary */
SELECT department_id
FROM data_sci.employees e1
WHERE ( SELECT MAX(salary) FROM data_sci.employees e2 ) = e1.salary


/*.....................................ROLL UP......................................*/
/* roll up makes a counting summary*/

SELECT cr.country_name, cr.region_name, count(e.*)
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
GROUP BY ROLLUP(cr.country_name, cr.region_name)
ORDER BY cr.country_name, cr.region_name

canada  british columbia   134
canada  nova scotia        164
canada  quebec             123
canada  [null]             421
usa     northeast          149
usa     northwest          137
usa     southeast          164
usa     southwest          175
usa     [null]             625
[null]  [null]            1046


/*.....................................CUBE......................................*/
/* Cube makes counting summaries making varios combinations of country and department*/
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY    
    CUBE(cr.country_name,
         cr.region_name,
         cd.department_name)
ORDER BY
    cr.country_name,
    cr.region_name,
    cd.department_name







REVIEW CODES

lock
begin
commit
explain