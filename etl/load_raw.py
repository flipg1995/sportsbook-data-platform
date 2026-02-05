import pandas as pd
import psycopg2
import os
from io import StringIO


POSTGRES_CONFIG = {
    "host": "postgres",
    "database": "sportsbook_dw",
    "user": "dw_user",
    "password": "dw_pass",
    "port": 5432,
}

RAW_DATA_PATH = "/opt/airflow/data/raw"

files = [
    "Sportsbook.csv",
    "Cashouts.csv",
    "Customer.csv",
    "Customer_crm_level.csv",
    "Events.csv",
]


def load_csv_to_postgres(csv_path, table_name, conn):
    df = pd.read_csv(csv_path)

    df.columns = [c.lower() for c in df.columns]

    cursor = conn.cursor()

    cursor.execute("CREATE SCHEMA IF NOT EXISTS raw;")

    cursor.execute(f'DROP TABLE IF EXISTS raw."{table_name}";')

    columns = ", ".join([f'"{col}" TEXT' for col in df.columns])
    create_table_sql = f"""
        CREATE TABLE raw."{table_name}" (
            {columns}
        );
    """
    cursor.execute(create_table_sql)

    buffer = StringIO()
    df.to_csv(buffer, index=False, header=False)
    buffer.seek(0)

    copy_sql = f'''
        COPY raw."{table_name}"
        FROM STDIN
        WITH (FORMAT CSV)
    '''
    cursor.copy_expert(copy_sql, buffer)

    conn.commit()
    cursor.close()


def main():
    conn = psycopg2.connect(**POSTGRES_CONFIG)

    for file in files:
        table_name = file.replace(".csv", "").lower()
        file_path = os.path.join(RAW_DATA_PATH, file)

        print(f"Loading {file_path} into table raw.{table_name}")

        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File not found: {file_path}")

        load_csv_to_postgres(file_path, table_name, conn)

    conn.close()
    print("Raw layer loaded successfully")


if __name__ == "__main__":
    main()
