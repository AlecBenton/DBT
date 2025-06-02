{% set source_table = source('public', 'table1') %}
{% set source_stream = source('public', 'table1_stream') %}

{% if is_incremental() %}

    -- Incremental run: get only INSERT and UPDATE actions from stream
    SELECT *
    FROM {{ source_stream }}
    WHERE metadata$action IN ('INSERT', 'UPDATE')

{% else %}

    -- Full-refresh: load entire base table
    SELECT *
    FROM {{ source_table }}

{% endif %}
