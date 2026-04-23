{{
  config(
    materialized = 'table',
    )
}}
SELECT
    prd_id,
    REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_')::char(5) AS cat_id,
    SUBSTRING(prd_key, 7, LENGTH(prd_key))::varchar(10) AS prd_key,
    prd_nm,
    COALESCE(prd_cost, 0) AS prd_cost,

    {{ map_case_upper_trim (
        'prd_line',
        {
            'R': 'Road',
            'S': 'Other',
            'M': 'Mountine',
            'T': 'Touring'
        }
    )}} AS prd_line,

    prd_start_dt,
    COALESCE(LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt) - 1, '9999-01-01') AS prd_end_dt,
    current_timestamp as dwh_load_dttm
from {{ source('bronze', 'crm_prd_info') }}