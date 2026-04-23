{{
  config(
    materialized = 'table',
    )
}}
SELECT
    sls_ord_num AS order_number,
    sls_prd_key AS product_number,
    sls_cust_id AS customer_id,
    sls_order_dt AS create_order_date,
    sls_ship_dt AS ship_order_date,
    sls_due_dt AS complete_order_date,
    sls_sales AS sold_product_revenue,
    sls_quantity AS sold_product_quantity,
    sls_price AS sold_product_price
FROM {{ ref('crm_sales_details') }}