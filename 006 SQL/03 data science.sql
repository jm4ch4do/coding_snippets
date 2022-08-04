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





















REVIEW CODES

lock
begin
commit