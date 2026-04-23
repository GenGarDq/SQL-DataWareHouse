{{
  config(
    materialized = 'table',
    )
}}
SELECT
    c.cst_id AS customer_id,
    c.cst_key AS customer_number,
    c.cst_firstname AS firstname,
    c.cst_lastname AS lastname,
    c.cst_marital_status AS marital_status,
    CASE
        WHEN c.cst_gndr != 'N/A' THEN c.cst_gndr
        ELSE COALESCE(ec.gen, 'N/A')
    END as gender,
    el.cntry AS country,
    ec.bdate AS birthday_date,
    c.cst_create_date as create_date
FROM {{ ref('crm_cst_info') }} c
LEFT JOIN {{ ref('erp_cust_az12') }} ec ON c.cst_key = ec.cid
LEFT JOIN {{ ref('erp_loc_a101') }} el ON c.cst_key = el.cid