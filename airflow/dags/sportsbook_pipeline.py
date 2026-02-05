from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="sportsbook_pipeline",
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=["sportsbook", "etl", "dbt"]
):

    python_etl = BashOperator(
        task_id="python_etl",
        bash_command="python /opt/airflow/etl/load_raw.py"
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd /opt/airflow/dbt && dbt run"
    )


    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /opt/airflow/dbt && dbt test"
    )


    python_etl >> dbt_run >> dbt_test
