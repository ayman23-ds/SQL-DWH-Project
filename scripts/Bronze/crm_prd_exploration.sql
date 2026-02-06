select   * from bronze_crm_prd_info;


select 
	count(*) as total_rows,
	count(prd_id) as id_rows,
	count(prd_key) as key_rows,
	count(prd_nm) as nm_rows,
	count(prd_cost) as cost_rows,
	count(prd_line) as line_rows,
	count(prd_start_dt) as start_dt_rows,
	count(prd_end_dt) as end_dt_rows
from bronze_crm_prd_info ; 


select *
from bronze_crm_prd_info 
where prd_end_dt is null;

select * from bronze_crm_prd_info 
where prd_cost is null ;-- expected 2

select distinct prd_cost from bronze_crm_prd_info 
order by prd_cost asc;


select distinct prd_line from bronze_crm_prd_info ;

