INSERT INTO silver_erp_cust_az12 (
			cid,
            bdate,
            gen
		)
        
select 
	substring(cid,4) as cid,
    bdate,
    case 
    when gen in ('m' ,'M','male','Male','Male\r','M \r','M\r') then 'male'
    when gen in ('f' ,'F','female','Female','Female\r','F \r','F\r') then 'female'
    end as gen 
from bronze_erp_cust_az12 ;

