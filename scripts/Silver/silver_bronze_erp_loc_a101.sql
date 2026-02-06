INSERT INTO silver_erp_loc_a101 (
			cid,
            cntry
		)

SELECT
  REPLACE(cid, '-', '') AS cid,
  CASE 
    WHEN UPPER(TRIM(cntry)) IN ('US', 'UNITED STATES') THEN 'United States'
    WHEN UPPER(TRIM(cntry)) IN ('DE', 'GERMANY') THEN 'Germany'
    ELSE TRIM(cntry)
  END AS cntry
from bronze_erp_loc_a101 ;




