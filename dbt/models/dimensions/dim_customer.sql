{{ config(materialized='table') }}

select
    customer_id,
    customer_datecreation_id,
    customer_gender_name,
    customer_birthday
from {{ ref('stg_customer') }}
