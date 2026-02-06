INSERT INTO silver_erp_cust_az12 (
			cid,
            bdate,
            gen
		)
        
select 
	substring(cid,4) as cid,
    bdate,
    case 
    when gen in ('m' ,'M','male','Male') then 'male'
    when gen in ('f' ,'F','female','Female') then 'female'
    end as bdate 
from bronze_erp_cust_az12 ;