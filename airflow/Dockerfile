FROM apache/airflow:2.8.1-python3.10

COPY requirements.txt /requirements.txt

USER airflow
RUN pip install --no-cache-dir -r /requirements.txt

RUN mkdir -p /opt/airflow/dbt/logs \
 && chown -R airflow: /opt/airflow/dbt
