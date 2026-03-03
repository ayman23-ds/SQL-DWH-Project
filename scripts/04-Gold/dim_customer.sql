insert into dim_customer (
	customer_id ,
	customer_key ,
	customer_firstname ,
	customer_lastname ,
	customer_marital_status ,
	customer_create_date  ,
	customer_DOB ,
	customer_country ,
	customer_gender 
)

SELECT
	silver_crm_cust_info.cst_id,
	silver_crm_cust_info.cst_key,
	silver_crm_cust_info.cst_firstname,
	silver_crm_cust_info.cst_lastname,
	silver_crm_cust_info.cst_marital_status,
	silver_crm_cust_info.cst_create_date,
	silver_erp_cust_az12.bdate,
	silver_erp_loc_a101 .cntry,
	COALESCE(silver_crm_cust_info.cst_gndr,silver_erp_cust_az12.gen) AS gender

FROM silver_crm_cust_info

left JOIN silver_erp_cust_az12 
ON silver_crm_cust_info.cst_key = silver_erp_cust_az12.cid 

left JOIN silver_erp_loc_a101 
ON silver_crm_cust_info.cst_key = silver_erp_loc_a101 .cid ;


