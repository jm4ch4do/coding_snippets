create extension fuzzystrmatch;


create extension if not exists fuzzystrmatch;


select
   soundex(‘Postgres’)






select
   soundex(‘Postgres’),
   soundex(‘Postgresss’)






select
   soundex(‘Postgres’),
   soundex(‘Postgresss’),
   (‘Postgres’ = ‘Postgresss’),
   soundex(‘Postgres’) = soundex(‘Postgresss’)




select
   difference(‘Postgres’,’Postgresss’)




select
   soundex(‘Postgres’),
   soudnex(‘Kostgres’),
   difference(‘Postgres’,’Kostgres’)




select
    levenshtein(‘Postgres’,’Postgres’)


select
    levenshtein(‘Postgres’,’Kostgres’)


select
    levenshtein(‘Postgres’,mySQL’)