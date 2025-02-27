/*......................................UPPER/LOWER.......................................*/
select upper(department_name)  /* upper lower initcap*/
from data_sci.company_departments


/*......................................TRIM.......................................*/
select ltrim(department_name)  /* ltrim rtrim trim*/
from data_sci.company_departments


/*......................................CONCAT.......................................*/
SELECT job_title || '-' || last_name  /* || is for concatenate */
FROM data_sci.employees

SELECT CONCAT(job_title, '-', last_name)  /* another way to concatenate
*/
FROM data_sci.employees


/*......................................SUBSTRINGS.......................................*/
SELECT SUBSTRING('abcdefghijk', 1, 3)  /* string index starts in 1 like MATLAB */
SELECT SUBSTRING('abcdefghijk' from 1 for 3)  /* works the same */


/*......................................LIKE.......................................*/
/* creates a new column is_assistant that has TRUE when job_title includes '%assistant%' */
SELECT job_title, (job_title like '%assistant%') is_assistant
FROM data_sci.employees
WHERE job_title like '%assistant%'


/*......................................REGULAR EXPRESSIONS.......................................*/
SELECT DISTINT job_title
FROM data_sci.employees
WHERE job_title SIMILAR TO '(vp%|web%)'  /* matching vp% or web%*/ 
                        'vp (a|m)%'  /* another example of a regular expresion where a or m can appear*/
                        
                        
/*......................................NUMBERS.......................................*/
SELECT TRUNC(AVG(salary)) /* No decimals */
FROM data_sci.employees

TRUNC(AVG(salary), 4) /* Truncate up to 4 decimal places */ 
ROUND(AVG(salary))  /* Round to nearest integer */
ROUND(AVG(salary), 2)  /* Round to two decimal points */
CEIL(AVG(salary))  /* Round up to the next integer */


/*.................................APPROXIMATE MATCHING..................................*/
/* install extension */
CREATE extension if not fuzzystrmatch  /* if not avoids displaying an error */

/* SOUNDEX */
/* selects element that sound like Postgres but may have been misspelled*/
SELECT soundex('Postgres')  /* returns P323 */
SELECT soundex('Postgressss')  /* also returns P323 */ 

/* DIFFERENCE */
SELECT difference('Postgres', 'Postgresss') /* returns difference of 3 */

/* LEVENSHTEIN */
SELECT levenshtein('Postgres', 'Postgres') /* returns 0 because you need to 
                                              substitute 0 chs to equal both expressions*/