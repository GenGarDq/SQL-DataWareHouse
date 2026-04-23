{{
  config(
    materialized = 'table',
    )
}}

SELECT
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    {{ int_to_date('sls_order_dt') }} AS sls_order_dt,
    {{ int_to_date('sls_ship_dt') }} AS sls_ship_dt,
    {{ int_to_date('sls_due_dt') }} AS sls_due_dt,

    CASE
        WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != ABS(sls_price) * sls_quantity
            THEN ABS(sls_price) * sls_quantity
        ELSE sls_sales
    END as sls_sales,

    sls_quantity,

    CASE
        WHEN sls_price IS NULL OR sls_price <= 0
            THEN sls_sales / NULLIF(sls_quantity, 0)
        ELSE sls_price
    END as sls_price,
    current_timestamp AS dwh_load_dttm
FROM {{ source('bronze', 'crm_sales_details') }}