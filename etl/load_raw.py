import pandas as pd
from sqlalchemy import create_engine
from pathlib import Path

engine = create_engine(
    "postgresql+psycopg2://dw_user:dw_pass@postgres:5432/sportsbook_dw"
)

DATA_PATH = "/data/raw"

tables = {
    "Customer.csv": "customers",
    "Customer_crm_level.csv": "customer_crm_level",
    "Events.csv": "events",
    "Sportsbook.csv": "sportsbook",
    "Cashouts.csv": "cashouts"
}

for file, table in tables.items():
    df = pd.read_csv(Path(DATA_PATH) / file)
    df.to_sql(
        table,
        engine,
        schema="raw",
        if_exists="replace",
        index=False
    )
    print(f"Loaded {file} into {table} table.")