select * from bronze_erp_loc_a101;

select cid ,count(*)
from bronze_erp_loc_a101
group by cid
having count(*) >1 ;


select * from  bronze_erp_loc_a101
where cntry is null ;

select * from  bronze_erp_loc_a101
where cid is null
