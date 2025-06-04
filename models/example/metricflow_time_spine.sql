-- models/example/time_spine.sql
select
    date_day as date_day
from
    POC.public.time_spine_table  -- or generate_series if creating dynamically
