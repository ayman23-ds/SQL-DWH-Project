INSERT INTO silver_crm_cust_info (
			cst_id, 
			cst_key, 
			cst_firstname, 
			cst_lastname, 
			cst_marital_status, 
			cst_gndr,
			cst_create_date
		)

with cte1 as (
	select * 
	from bronze_crm_cust_info
)
-- cte2 first name and last name are cleaned
,cte2 as(
select 
cst_id,
cst_key,
trim(cst_firstname) as cst_firstname,
trim(cst_lastname) as cst_lastname,
case 
	when cst_marital_status in ("m","M") then "married"
    when cst_marital_status in ("s","S") then "single"
	else cst_marital_status
end as cst_marital_status,

case 
	when cst_gndr in ("m","M") then "male"
    when cst_gndr in ("f","F") then "female"
    else cst_gndr
    end as cst_gndr,
cst_create_date
from cte1

)

, cte3 as (
select * from cte2
where cst_id is not null
)

,not_duplicated AS (
   SELECT
         cst_id,
         MAX(cst_create_date) AS max_date
   FROM cte3
   GROUP BY cst_id )

-- cte4 id and first name and last name are cleaned
, cte4 as (
select 
cte3.cst_id,
cte3.cst_key,
cte3.cst_firstname,
cte3.cst_lastname,
cte3.cst_marital_status,
cte3.cst_gndr,
cte3.cst_create_date
from cte3 
inner join not_duplicated 
on cte3.cst_id = not_duplicated.cst_id and cte3.cst_create_date = not_duplicated.max_date

)

select * from cte4 ;


