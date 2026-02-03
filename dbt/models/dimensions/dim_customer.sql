select
    customer_id,
    gender,
    birth_date,
    registration_date,
    extract(year from age(birth_date)) as age
from staging.stg_customers
