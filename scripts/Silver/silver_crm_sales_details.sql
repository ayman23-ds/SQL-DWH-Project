insert into silver_crm_sales_details (
sls_ord_num ,
sls_prd_key ,
sls_cust_id ,
sls_order_dt ,
sls_ship_dt ,
sls_due_dt ,
sls_sales  ,
sls_quantity ,
sls_price 

)

with cte0 as(
select
sls_ord_num ,
sls_prd_key ,
sls_cust_id ,
NULLIF(sls_order_dt, 0) AS sls_order_dt,
sls_ship_dt ,
sls_due_dt ,
case 
    when sls_sales <= 0 then abs(sls_sales )
    else sls_sales 
    end as sls_sales ,
sls_quantity ,
case 
    when sls_price <= 0 then abs(sls_price )
    else sls_price 
    end  as sls_price 
from bronze_crm_sales_details 
where char_length(sls_order_dt) in (6,7,8)
)

, cte1 as (
select * 
from cte0
)
, cte2 as (
select
sls_ord_num ,
sls_prd_key ,
sls_cust_id ,
sls_order_dt,
sls_ship_dt ,
sls_due_dt ,
(sls_price*sls_quantity) as sls_sales ,
sls_quantity ,
(sls_sales/sls_quantity) as sls_price 
from cte1
where length(sls_order_dt) <= 8

)

SELECT *
FROM cte2

