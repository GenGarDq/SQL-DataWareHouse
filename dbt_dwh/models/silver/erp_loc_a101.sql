{{
  config(
    materialized = 'table',
    )
}}

SELECT
    REPLACE(cid, '-', '') AS cid,
    {{ map_case_upper_trim(
        'cntry',
        {
            'US': 'United States',
            'DE': 'Germany',
            'USA': 'United States',
            'AUSTRALIA': 'Australia',
            'GERMANY': 'Germany',
            'CANADA': 'Canada',
            'UNITED STATES': 'United States',
            'FRANCE': 'France',
            'UNITED KINGDOM': 'United Kingdom'
        },
        output_type = 'varchar'
    )}} AS cntry,
    current_timestamp AS dwh_load_dttm
FROM {{ source('bronze', 'erp_loc_a101') }}