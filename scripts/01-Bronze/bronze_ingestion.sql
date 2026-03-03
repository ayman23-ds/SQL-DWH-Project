show variables like 'local_infile';
-- SET global local_infile =1;
-- show variables like 'local_infile';

USE datawarehouse;

LOAD DATA LOCAL INFILE 'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_crm/cust_info.csv'
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, @dt)
SET cst_create_date = STR_TO_DATE(@dt, '%d/%m/%Y');


LOAD DATA LOCAL INFILE 'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_crm/prd_info.csv'
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(prd_id, prd_key, prd_nm, prd_cost, prd_line, @start_dt, @end_dt)
SET
  prd_start_dt = STR_TO_DATE(@start_dt, '%d/%m/%Y'),
  prd_end_dt   = STR_TO_DATE(@end_dt,   '%d/%m/%Y');


LOAD DATA LOCAL INFILE 
'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_crm/sales_details.csv'
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,sls_ship_dt,sls_due_dt,sls_sales,sls_quantity,sls_price);




LOAD DATA LOCAL INFILE
'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_erp/CUST_AZ12.csv'
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cid, @dt, gen)
SET bdate = STR_TO_DATE(@dt, '%d/%m/%Y');


LOAD DATA LOCAL INFILE
'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_erp/LOC_A101.csv'
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cid, cntry);


LOAD DATA LOCAL INFILE
'D:/COURSES/Data Craft/Begginer Level/Module 3 -DWH/Data_Sources/Data_Sources/source_erp/PX_CAT_G1V2.csv'
INTO TABLE bronze_erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, cat, subcat, maintenance);


