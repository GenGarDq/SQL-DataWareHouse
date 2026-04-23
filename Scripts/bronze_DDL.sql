CREATE TABLE IF NOT EXISTS silver.crm_cst_info(
	cst_id int,
	cst_key varchar(50),
	cst_firstname varchar(50),
	cst_lastname varchar(50),
	cst_marital_status varchar(10),
	cst_gndr varchar(10),
	cst_create_date date,
	dwh_load_date timestamp DEFAULT current_timestamp
	);

CREATE TABLE IF NOT EXISTS silver.crm_prd_info(
	prd_id int,
	prd_key varchar(50),
	prd_nm varchar(50),
	prd_cost int,
	prd_line varchar(10),
	prd_start_dt date,
	prd_end_dt date,
	dwh_load_date timestamp DEFAULT current_timestamp
	);

CREATE TABLE IF NOT EXISTS silver.crm_sales_details(
	sls_ord_num varchar(50),
	sls_prd_key varchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int,
	dwh_load_date timestamp DEFAULT current_timestamp
	);

CREATE TABLE IF NOT EXISTS silver.erp_cust_az12(
	cid varchar(50),
	bdate date,
	gen varchar(10),
	dwh_load_date timestamp DEFAULT current_timestamp
	);

CREATE TABLE IF NOT EXISTS silver.erp_loc_a101(
	cid varchar(50),
	cntry varchar(50),
	dwh_load_date timestamp DEFAULT current_timestamp
	);

CREATE TABLE IF NOT EXISTS silver.erp_px_cat_g1v2(
	id varchar(10),
	cat varchar(50),
	subcat varchar(50),
	maintenance varchar(10),
	dwh_load_date timestamp DEFAULT current_timestamp
	);

