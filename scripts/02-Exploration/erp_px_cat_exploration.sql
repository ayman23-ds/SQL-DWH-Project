select * from bronze_erp_px_cat_g1v2;

select distinct maintenance 
from bronze_erp_px_cat_g1v2;

select 
maintenance,
count(*)
from bronze_erp_px_cat_g1v2
group by maintenance
having count(*) > 1;

select distinct id 
from bronze_erp_px_cat_g1v2;

select 
id,
count(*)
from bronze_erp_px_cat_g1v2
group by id
having count(*) > 1;

select distinct cat 
from bronze_erp_px_cat_g1v2;

select 
cat,
count(*)
from bronze_erp_px_cat_g1v2
group by cat
having count(*) > 1;


select distinct subcat 
from bronze_erp_px_cat_g1v2;

select 
subcat,
count(*)
from bronze_erp_px_cat_g1v2
group by subcat
having count(*) > 1;