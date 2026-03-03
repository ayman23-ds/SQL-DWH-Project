insert into  dim_product (
	product_id ,
    product_category_id,
	product_key ,
	product_number ,
	product_cost ,
	product_line ,
	product_categoty ,
	product_subcategory ,
	product_maintenance ,
	product_start_date ,
	product_is_current

)

select 
	a.prd_id,
    a.cat_id ,
	a.prd_key,
	a.prd_nm,
	a.prd_cost,
	a.prd_line,
	b.cat,
	b.subcat,
	b.maintenance,
	a.prd_start_dt,
	a.is_current
from silver_crm_prd_info as a
left join silver_erp_px_cat_g1v2 as b
on a.cat_id = b.id