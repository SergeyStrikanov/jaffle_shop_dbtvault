{{
    config(
        enabled=True
    )
}}



select 
	hc.customer_key,
	scd.first_name,
	scd.last_name,
	scd.email,
	ncd.country,
	ncd.age
from 
   (
	select 
		agg_p.customer_pk,
		max(agg_p.pit_load_date) dt
	from dbt.pit agg_p
	group by agg_p.customer_pk
	) agg
join dbt.pit p
	on agg.customer_pk = p.customer_pk
	and agg.dt = p.pit_load_date
	and p.customer_key = '102'
left join dbt.hub_customer hc
	on hc.customer_pk = p.customer_pk
left join dbt.sat_customer_details scd
	on hc.customer_pk = scd.customer_pk
	and p.load_date = scd.load_date
left join dbt.sat_new_customer_details ncd
	on hc.customer_pk = ncd.customer_pk
	and p.new_load_date = ncd.load_date