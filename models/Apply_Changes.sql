{% set target_table = 'public.table2' %}
{% set source_stream = 'public.table1_stream' %}

MERGE INTO {{ target_table }} AS target
USING (
    SELECT * FROM {{ source_stream }}
) AS source
ON target.id = source.id  -- Use your actual primary key column

WHEN MATCHED AND metadata$action = 'DELETE' THEN
    DELETE

WHEN MATCHED AND metadata$action = 'UPDATE' THEN
    UPDATE SET
        name = source.name,
        UPDATED_AT = source.UPDATED_AT  -- List all columns that can be updated

WHEN NOT MATCHED THEN
    INSERT (id, name, UPDATED_AT)  -- List all columns
    VALUES (source.id, source.name, source.UPDATED_AT);
