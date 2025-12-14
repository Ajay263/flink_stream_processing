FROM flink:1.17.1

# Copy Kafka connector
ADD jars/flink-sql-connector-kafka-1.17.0.jar /opt/flink/lib/

# Copy JDBC connector
ADD jars/flink-connector-jdbc-3.1.0-1.17.jar /opt/flink/lib/

# Copy PostgreSQL driver
ADD jars/postgresql-42.6.0.jar /opt/flink/lib/

# Copy Postgres CDC connector
ADD jars/flink-sql-connector-postgres-cdc-2.3.0.jar /opt/flink/lib/