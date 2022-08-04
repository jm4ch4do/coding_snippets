/* SQL (Structured Query Language) */

/*........................................DATATYPES........................................*/
    True, False                      -- Boolean
    char, varchar, text              -- Character
    integer, floating                -- Numeric
    date, time, timestamp, interval  -- Temporal
    UUID                             -- Universally Unique Identifiers
    Array          
    JSON
    Network Address

/*........................................CONSTRAINTS........................................*/
    -- Rules to prevent invalid data. There are column constraints and table constraints

    -- Column Constraints
    NOT NULL     UNIQUE    PRIMARY KEY    FOREIGN KEY    CHECK    EXCLUSION 

    -- Table Constraints
    CHECK    REFERENCES    UNIQUE(column list)    PRIMARY KEY (column_list)
.
.
/*........................................CREATE TABLE........................................*/
/*-----SYNTAX-----*/
    CREATE TABLE table_name(
        column_name TYPE column_constraint,
        column_name TYPE column_constraint,
        table_constraint table_constraint
    ) INHERITS existing_table_name;

/*-----EXAMPLE1-----*/
    CREATE TABLE players(
        player_id SERIAL PRIMARY KEY
        age SMALLINT NOT NULL -- SMALLINT goes from -32768 to 32767
    )

/*-----EXAMPLE2 JOINT TABLE-----*/
    CREATE TABLE account(
        user_id SERIAL PRIMARY KEY,
        username VARCHAR(50) UNIQUE NOT NULL,
        password VARCHAR(50) NOT NULL,
        email VARCHAR(250) UNIQUE NOT NULL,
        create_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP
    )

    CREATE TABLE job(
        job_id SERIAL PRIMARY KEY,
        job_name VARCHAR(200) UNIQUE NOT NULL
    )

    CREATE TABLE account_job(
        user_id INTEGER REFERENCES account(user_id),
        job_id INTEGER REFERENCES job(job_id),
        hire_date TIMESTAMP
    )


)
.
.
/*........................................INSERT TABLE........................................*/
/*-----SYNTAX-----*/
    INSERT INTO table_name(column1, column2, ...)
    values
        (value1, value2, ...)
        (value1, value2, ...), ...;

/*-----SYNTAX FROM ANOTHER TABLE-----*/
    INSERT INTO table(column1, column2, ...)
    SELECT column1, column2,...
    FROM another_table
    WHERE condition;

/*-----EXAMPLE INSERT-----*/
    INSERT INTO account(username,password,email,create_on)
    values
    ('Jose','password','jose@gmail.com',CURRENT_TIMESTAMP)

    INSERT INTO job(job_name)
    VALUES('Astro')
    INSERT INTO job(job_name)
    VALUES('President')

    INSERT INTO account_job(user_id, job_id, hire_date)
    VALUES(1,1, CURRENT_TIMESTAMP)
.
.
/*........................................UPDATE........................................*/
/*-----EXAMPLES-----*/
    -- Set timeStamp of all records to now
    UPDATE account
    SET last_login = CURRENT_TIMESTAMP

    -- Set timeStamp only for empty records
    UPDATE account
    SET last_login = CURRENT_TIMESTAMP
    WHERE last_login IS NULL;

    -- Set value based on another column
    UPDATE account
    SET last_login = created_on

    -- Set based on a field from another table (update join)
    UPDATE tableA
    SET original_col = tableB.new_col
    FROM tableB
    WHERE tableA.id = tableB.id

    -- Return affected rows
    UPDATE account
    SET last_login = created_on
    RETURNING account_id, last_login
.
.
/*........................................UPDATE........................................*/
    /*-----EXAMPLES-----*/
    --Simple
    DELETE FROM tablea WHERE row_id = 1

    --Delete related
    DELETE FROM tableA USING tableB WHERE tableA.id = tableB.id

    --Delete All
    DELETE FROM table

    --Return results
    DELETE FROM job
    WHERE job_name = 'Cowboy'
    RETURNING job_id, job_name
.
.
/*........................................ALTER........................................*/
/*-----SYNTAX-----*/
ALTER TABLE table_name action

ALTER TABLE table_name
ADD COLUMN new_col TYPE  -- add

ALTER TABLE table_name
DROP COLUMN col_name TYPE  -- drop

ALTER TABLE table_name
ALTER COLUMN col_name  -- alter
SET DEFAULT value         DROP DEFAULT        SET NOT NULL    DROP NOT NULL
ADD CONSTRAINT constraint_name

/*-----EXAMPLES-----*/
    --create
    CREATE TABLE information(
    info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE

    --change table_name
    ALTER TABLE information
    RENAME TO new_info

    --rename field
    ALTER TABLE new_info
    RENAME COLUMN person TO people

    --drop constraint
    ALTER TABLE new_info
    ALTER COLUMN people DROP NOT NULL

    --insert
    INSERT INTO new_info(title)
    VALUES('some new title')

    --drop syntax
    ALTER TABLE table_name
    DROP COLUMN col_name

    --drop syntax to also remove dependencies
    ALTER TABLE table_name
    DROP COLUMN col_name CASCADE

        --drop syntax multiple columns
    ALTER TABLE table_name
    DROP COLUMN col_one
    DROP COLUMN col_two
