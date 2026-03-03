insert into silver_erp_px_cat_g1v2 
(
id,
cat,
subcat,
maintenance

)

select
	replace(id,"_","-") as id,
    cat,
    subcat,
    maintenance
from bronze_erp_px_cat_g1v2;