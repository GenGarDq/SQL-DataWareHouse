{{
  config(
    materialized = 'table',
    )
}}
WITH no_duplicates AS(
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM {{ source('bronze', 'crm_cst_info') }}
)
SELECT
    cst_id,
    cst_key,
    TRIM(cst_firstname)::VARCHAR(50) AS cst_firstname,
    TRIM(cst_lastname)::VARCHAR(50) AS cst_lastname,

    {{ map_case_upper_trim(
    'cst_marital_status',
    {
        'M': 'Married',
        'S': 'Single'
    }
    ) }} AS cst_marital_status,

    {{ map_case_upper_trim(
    'cst_gndr',
    {
        'M': 'Male',
        'F': 'Female'
    }
    ) }} AS cst_gndr,
    
    cst_create_date,
    current_timestamp AS dwh_load_dttm
FROM no_duplicates
WHERE flag_last = 1 AND cst_id IS NOT NULL
