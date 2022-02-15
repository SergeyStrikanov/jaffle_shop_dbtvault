{{
    config(
        enabled=True
    )
}}



select 
	to_char(ord.order_date, 'day') day_week, 
	ord.status, 
	count(ord.order_date) count_orders 
from dbt.sat_order_details ord
group by to_char(ord.order_date, 'day'), ord.status