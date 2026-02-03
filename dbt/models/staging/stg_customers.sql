select
    Customer_ID as customer_id,
    Customer_Gender_Name as gender,
    date(Customer_Birthday) as birth_date,
    date(Customer_DateCreation_ID) as registration_date
from raw.customers
