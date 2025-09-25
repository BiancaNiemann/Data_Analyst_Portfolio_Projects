{{ config(materialized='table') }}

select 
    customer_id,
    customer_country,
    case
        when count(distinct age_group) > 1 then 'Unknown'
        else MAX(age_group)
    end as age_group,
    case
        when count(distinct customer_gender) > 1 then 'Unknown'
        else MAX(customer_gender)
    end as customer_gender
from {{ ref('int_unioned_orders') }}
GROUP BY 1, 2
