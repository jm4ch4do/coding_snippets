/*.................................EXPLAIN..................................*/
/* You can put explain on top of any statement to see the SQL execution plan*/
EXPLAIN

/* Show more details including the execution time */
EXPLAIN (analyze, verbose, buffers)


/*..................................INDEX...................................*/
/* Add index to fields involved in the queries in WHERE statement */
CREATE INDEX person_first_name_idx
ON person (first_name);

SELECT COUNT(*)
FROM person
WHERE first_name = 'Emma';

/* multi column index */
CREATE INDEX person_first_name_last_name_idx
ON person (last_name, first_name)


/*................................SORTING/CAL.................................*/
/* Avoid sorting and calculations when possible to improve speed*/



/*............................AVOID NESTED VIEWS............................*/
CREATE VIEW female_employes AS
SELECT * FROM employee e
WHERE e.gender='Female'

SELECT * FROM female_employees

/*............................USE PARTITIONING............................*/
Range Partitioning
List Partitioning
Hash Partitioning


CREATE TABLE sales_2020_Q2 PARTITION OF sales FOR VALUES FROM ('2020-04-01') TO ('2020-07-01');