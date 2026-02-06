use datawarehouse;

create table silver_crm_cust_info (
cst_id int ,
cst_key varchar(50) ,
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(20),
cst_gndr varchar(20),
cst_create_date date,
primary key (cst_id)
);

create table silver_crm_prd_info (
prd_id int ,
cat_id varchar(50) ,
prd_key varchar(50) ,
prd_nm varchar(50),
prd_cost int,
prd_line varchar(30),
prd_start_dt datetime,
is_current int,
primary key (prd_id)
);



create table silver_crm_sales_details (
sk INT NOT NULL AUTO_INCREMENT,
sls_ord_num varchar(50) ,
sls_prd_key varchar(50) ,
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int ,
sls_quantity int,
sls_price int,
primary key (sk)
);


create table silver_erp_cust_az12(
cid varchar(50),
bdate date ,
gen varchar(20),
primary key (cid)
);

create table silver_erp_loc_a101(
cid varchar(50),
cntry varchar(50),
primary key (cid)
);

create table silver_erp_px_cat_g1v2(
id varchar(50),
cat varchar(50),
subcat varchar(50),
maintenance varchar(20),
primary key (id)
);
