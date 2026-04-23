{{
  config(
    materialized = 'table',
    )
}}
SELECT
    CASE
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LENGTH(cid))
        ELSE cid
    END AS cid,

    CASE
        WHEN bdate >= CURRENT_TIMESTAMP OR bdate < CURRENT_TIMESTAMP - INTERVAL '100 years' THEN NULL
        ELSE bdate
    END AS bdate,

    {{ map_case_upper_trim(
        'gen',
        {
            'F': 'Female',
            'M': 'Male',
            'FEMALE': 'Female',
            'MALE': 'Male'
        }
    )}} as gen
FROM {{ source('bronze', 'erp_cust_az12') }}