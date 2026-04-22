import psycopg2


conn = psycopg2.connect(
    dbname='DataWareHouse',
    host='localhost',
    port='5432',
    user='postgres',
    password='postgres'
)

cur = conn.cursor()


def load_script(path, filename, target_table, layer='bronze'):
    full_path = f'{path}/{filename}'
    target = f'{layer}.{target_table}'
    cur.execute(
        f'TRUNCATE TABLE {target}'
    )
    with open(full_path, 'r') as file:
        cur.copy_expert(
            f"COPY {target} FROM STDIN WITH CSV HEADER DELIMITER ','",
            file
        )


path_crm = './datasets/source_crm'
path_erp = './datasets/source_erp'

load_script(path_crm, 'cust_info.csv', 'crm_cst_info')
load_script(path_crm, 'prd_info.csv', 'crm_prd_info')
load_script(path_crm, 'sales_details.csv', 'crm_sales_details')
load_script(path_erp, 'CUST_AZ12.csv', 'erp_cust_az12')
load_script(path_erp, 'LOC_A101.csv', 'erp_loc_a101')
load_script(path_erp, 'PX_CAT_G1V2.csv', 'erp_px_cat_g1v2')

conn.commit()
cur.close()
conn.close()
