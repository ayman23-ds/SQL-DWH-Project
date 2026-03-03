use datawarehouse;
insert into silver_crm_prd_info
(	prd_id ,
	cat_id ,
	prd_key ,
	prd_nm ,
	prd_cost,
	prd_line ,
	prd_start_dt,
	is_current
)

select 
	prd_id ,
	substring(prd_key ,1,5)as cat_id ,
    substring(prd_key ,7)as prd_key,
	prd_nm ,
	case 
		when prd_cost is null then 0
		else prd_cost
    end as prd_cost,
	prd_line ,
	prd_start_dt,
    case 
		when prd_end_dt is null then 1 
        when prd_end_dt is not null then 0
        end as is_current
from bronze_crm_prd_info ; 

