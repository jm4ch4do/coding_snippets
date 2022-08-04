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
















REVIEW CODES

lock
begin
commit