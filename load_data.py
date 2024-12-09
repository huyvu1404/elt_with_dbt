import os
import sqlalchemy
import pandas as pd
from dotenv import load_dotenv

# Load postgres connection info from .env file
load_dotenv()
psql_user = os.getenv('POSTGRES_USER')
psql_password = os.getenv('POSTGRES_PASSWORD')
psql_hostname = os.getenv('POSTGRES_HOST')
psql_port = os.getenv('POSTGRES_PORT')
psql_database_name = os.getenv('POSTGRES_DB')

# Create postgres engine
engine = sqlalchemy.create_engine(f'postgresql+psycopg2://{psql_user}:{psql_password}@{psql_hostname}:{psql_port}/{psql_database_name}')

# Load each CSV file into postgres database as a table
data_names = ['olist_customers_dataset', 'olist_orders_dataset', 'olist_order_items_dataset', 'olist_order_payments_dataset', 'olist_products_dataset']
for name in data_names:
    try:
        df = pd.read_csv(f'./data/{name}.csv')
        df.to_sql(
            name=name,
            con=engine,
            schema='public',
            index=False,
            if_exists='replace'
        )
        print(f'File {name} loaded to PostgreSQL database successfully!')
    except Exception as e:
        print('Error occured:', e)
    