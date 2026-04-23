{{
  config(
    materialized = 'table',
    )
}}
SELECT
    cp.prd_id AS product_id,
    cp.prd_key AS product_number,
    cp.prd_nm AS product_name,
    cp.prd_cost AS product_cost,
    cp.prd_line AS product_type,
    cp.cat_id AS category_id,
    ep.cat as category,
    ep.subcat as subcategory,
    ep.maintenance as maintenance
FROM {{ ref('crm_prd_info') }} cp
LEFT JOIN {{ ref('erp_px_cat_g1v2') }} ep ON cp.cat_id = ep.id
WHERE cp.prd_end_dt = '9999-01-01'