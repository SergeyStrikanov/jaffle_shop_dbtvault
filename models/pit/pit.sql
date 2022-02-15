{{
    config(
        enabled=True
    )
}}



select
	hc.customer_pk,
	hc.customer_key,
	current_date pit_load_date,
	scd.load_date,
	ncd.load_date new_load_date
from dbt.hub_customer hc
left join dbt.sat_customer_details scd
	on hc.customer_pk = scd.customer_pk
left join dbt.sat_new_customer_details ncd
	on hc.customer_pk = ncd.customer_pk