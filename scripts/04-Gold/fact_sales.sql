use datawarehouse;
insert into fact_sales (
	order_number ,
    product_key ,
    customer_id ,
    order_date ,
    shipping_date ,
    due_date ,
    sales ,
    quantity ,
    price 
  
)

select 
sls_ord_num,
sls_prd_key,
sls_cust_id ,
sls_order_dt ,
sls_ship_dt ,
sls_due_dt ,
sls_sales ,
sls_quantity ,
sls_price 

from silver_crm_sales_details;
