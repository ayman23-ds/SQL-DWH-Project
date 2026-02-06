select * from bronze_erp_cust_az12;

DESCRIBE bronze_erp_cust_az12;

select 
	count(*) as total_rows,
	count(cid) as cid,
	count(bdate) as bdate,
	count(gen) as gen
from bronze_erp_cust_az12;
-- 18484    18484   18484   17012


SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN cid IS NULL THEN 1 ELSE 0 END) AS cid,
  SUM(CASE WHEN bdate IS NULL THEN 1 ELSE 0 END) AS bdate,
  SUM(CASE WHEN gen IS NULL THEN 1 ELSE 0 END) AS gen
FROM bronze_erp_cust_az12;
-- expected 1417 for gen 

select distinct gen 
FROM bronze_erp_cust_az12;

SELECT
  SUM(gen IS NULL)                      AS null_cnt,
  SUM(gen = '')                         AS empty_cnt,
  SUM(gen = ' ')                        AS single_space_cnt,
  SUM(gen <> TRIM(gen)) AS has_spaces_around_cnt
FROM bronze_erp_cust_az12;
-- expected 1471   4    4   0



SELECT
  COUNT(*) AS empty_string_cnt
FROM bronze_erp_cust_az12
WHERE gen = '';


SELECT
  gen,
  COUNT(*) AS cnt,
  MIN(LENGTH(gen)) AS min_len,
  MAX(LENGTH(gen)) AS max_len,
  MIN(HEX(gen)) AS sample_hex
FROM bronze_erp_cust_az12
GROUP BY gen
ORDER BY cnt DESC
LIMIT 50;

SELECT
  COUNT(*) AS total_rows,
  SUM(gen IS NULL) AS null_cnt,
  SUM(gen = '') AS empty_string_cnt
FROM bronze_erp_cust_az12;

select distinct gen 
FROM bronze_erp_cust_az12;

SELECT
  COUNT(*) AS total_rows,
  SUM(gen IS NULL) AS null_cnt,
  SUM(gen = '') AS empty_string_cnt,
  SUM(TRIM(gen) = '') AS trim_empty_cnt,
  SUM(gen = CHAR(13)) AS only_cr_cnt,
  SUM(gen LIKE CONCAT('%', CHAR(13), '%')) AS has_cr_inside_cnt
FROM bronze_erp_cust_az12;


select 
cid,
count(*)
from bronze_erp_cust_az12
group by cid
having count(*) > 1 ;




select 
distinct bdate
from bronze_erp_cust_az12

