select * from bronze_crm_sales_details; 

select 
	count(*) as total_rows,
	count(sls_ord_num) as ord_num_rows,
	count(sls_prd_key) as prd_key_rows,
	count(sls_cust_id) as cust_id_rows,
	count(sls_order_dt) as order_dt_rows,
	count(sls_ship_dt) as ship_dt_rows,
	count(sls_due_dt) as due_dt_rows,
	count(sls_sales) as sales_rows,
	count(sls_quantity) as quantity_rows,
	count(sls_price) as price_rows
from bronze_crm_sales_details;
-- sales , price


SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN sls_ord_num IS NULL THEN 1 ELSE 0 END) AS sls_ord_num,
  SUM(CASE WHEN sls_prd_key IS NULL THEN 1 ELSE 0 END) AS sls_prd_key,
  SUM(CASE WHEN sls_cust_id IS NULL THEN 1 ELSE 0 END) AS sls_cust_id,
  SUM(CASE WHEN sls_order_dt IS NULL THEN 1 ELSE 0 END) AS sls_order_dt,
  SUM(CASE WHEN sls_ship_dt IS NULL THEN 1 ELSE 0 END) AS sls_ship_dt,
  SUM(CASE WHEN sls_due_dt IS NULL THEN 1 ELSE 0 END) AS sls_due_dt,
  SUM(CASE WHEN sls_sales IS NULL THEN 1 ELSE 0 END) AS sls_sales,
  SUM(CASE WHEN sls_quantity IS NULL THEN 1 ELSE 0 END) AS sls_quantity,
  SUM(CASE WHEN sls_price IS NULL THEN 1 ELSE 0 END) AS sls_price
FROM bronze_crm_sales_details;
-- expected 60398 / 0 /0 /0 /0 /0 /0 /8 /0 /7   > sales , price


SELECT
  SUM(sls_sales IS NULL)                      AS null_cnt,
  SUM(sls_sales = '')                         AS empty_cnt,
  SUM(sls_sales = ' ')                        AS single_space_cnt,
  SUM(sls_sales LIKE ' %' OR sls_sales LIKE '% ') AS has_spaces_around_cnt
FROM bronze_crm_sales_details; 
-- expected 7 / 0 /0/0


SELECT
  SUM(sls_price IS NULL)                      AS null_cnt,
  SUM(sls_price = '')                         AS empty_cnt,
  SUM(sls_price = ' ')                        AS single_space_cnt,
  SUM(sls_price LIKE ' %' OR sls_price LIKE '% ') AS has_spaces_around_cnt
FROM bronze_crm_sales_details; 
-- expected 7 / 0 /0/0


select * 
FROM bronze_crm_sales_details
where sls_price <= 0 ;
-- expected 0 


select * 
FROM bronze_crm_sales_details
where sls_sales <= 0;


SELECT * 
FROM bronze_crm_sales_details
where sls_sales = '' ;

SELECT * 
FROM bronze_crm_sales_details
where sls_order_dt <= 0 ;


SELECT * 
FROM bronze_crm_sales_details
where sls_order_dt >= sls_ship_dt;

SELECT * 
FROM bronze_crm_sales_details
where sls_sales is null ;

SELECT * 
FROM bronze_crm_sales_details
where sls_quantity <=0
