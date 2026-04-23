{{
  config(
    materialized = 'table',
    )
}}
SELECT
    id,
    cat,
    subcat,
    maintenance,
    current_timestamp AS dwh_load_dttm
FROM {{ source('bronze', 'erp_px_cat_g1v2') }}