select   * from bronze_crm_cust_info;
/* 
cst_id
cst_key
cst_firstname
cst_lastname
cst_matital_status
cst_gndr
cst_create_date
*/

select 
	count(*) as total_rows,
	count(cst_id) as id_rows,
	count(cst_key) as key_rows,
	count(cst_firstname) as FN_rows,
	count(cst_lastname) as LN_rows,
	count(cst_marital_status) as marital_status_rows,
	count(cst_gndr) as gender_rows,
	count(cst_create_date) as creation_date_rows
from bronze_crm_cust_info ; 

select
distinct cst_gndr
from bronze_crm_cust_info ;

SELECT
  SUM(cst_gndr IS NULL)                      AS null_cnt,
  SUM(cst_gndr = '')                         AS empty_cnt,
  SUM(cst_gndr = ' ')                        AS single_space_cnt,
  SUM(cst_gndr LIKE ' %' OR cst_gndr LIKE '% ') AS has_spaces_around_cnt
FROM bronze_crm_cust_info;

SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN cst_id IS NULL THEN 1 ELSE 0 END) AS null_rows_id,
  SUM(CASE WHEN cst_key IS NULL THEN 1 ELSE 0 END) AS null_rows_key,
  SUM(CASE WHEN cst_firstname IS NULL THEN 1 ELSE 0 END) AS null_rows_firstname,
  SUM(CASE WHEN cst_lastname IS NULL THEN 1 ELSE 0 END) AS null_rows_lastname,
  SUM(CASE WHEN cst_marital_status IS NULL THEN 1 ELSE 0 END) AS null_rows_marital_status,
  SUM(CASE WHEN cst_gndr IS NULL THEN 1 ELSE 0 END) AS null_rows_gndr,
  SUM(CASE WHEN cst_create_date IS NULL THEN 1 ELSE 0 END) AS null_rows_create_date
FROM bronze_crm_cust_info;


select 
count(*) as total_rows,
count(distinct (cst_id)) as distinct_id,
count(distinct (cst_key)) as distinct_key,
count(distinct (cst_gndr)) as distinct_gndr,
count(distinct (cst_marital_status)) as distinct_marital_status

from bronze_crm_cust_info ;


-- repeated value
select 
cst_id,
count(*)
from bronze_crm_cust_info
group by cst_id
having count(*) > 1 ;


-- repeated value
select 
cst_key,
count(*)
from bronze_crm_cust_info
group by cst_key
having count(*) > 1 ;


-- first name 
SELECT COUNT(*) as start_with_space
FROM bronze_crm_cust_info
WHERE cst_firstname LIKE ' %';

SELECT COUNT(*) as end_with_space
FROM bronze_crm_cust_info
WHERE cst_firstname LIKE '% ';


-- last name 
SELECT COUNT(*) as start_with_space
FROM bronze_crm_cust_info
WHERE cst_lastname LIKE ' %';

SELECT COUNT(*) as end_with_space
FROM bronze_crm_cust_info
WHERE cst_lastname LIKE '% ';
