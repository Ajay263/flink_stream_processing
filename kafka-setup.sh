#!/bin/bash

# Create accounts topic
docker exec -it kafka kafka-topics \
    --create --topic accounts \
    --partitions 1 \
    --config cleanup.policy=compact,delete \
    --config retention.ms=600000 \
    --bootstrap-server kafka:9092

# Create customers topic
docker exec -it kafka kafka-topics \
    --create --topic customers \
    --partitions 1 \
    --config cleanup.policy=compact,delete \
    --config retention.ms=600000 \
    --bootstrap-server kafka:9092

# Create transactions topic
docker exec -it kafka kafka-topics \
    --create --topic transactions \
    --partitions 5 \
    --bootstrap-server kafka:9092

# Create transactions.credit topic
docker exec -it kafka kafka-topics \
    --create --topic transactions.credit \
    --partitions 5 \
    --bootstrap-server kafka:9092

# Create transactions.debit topic
docker exec -it kafka kafka-topics \
    --create --topic transactions.debit \
    --partitions 5 \
    --bootstrap-server kafka:9092

# List all topics
docker exec -it kafka kafka-topics \
    --list \
    --bootstrap-server kafka:9092

# Describe accounts topic
docker exec -it kafka kafka-topics \
    --describe --topic accounts \
    --bootstrap-server kafka:9092

# Describe customers topic
docker exec -it kafka kafka-topics \
    --describe --topic customers \
    --bootstrap-server kafka:9092

# List topics again
docker exec -it kafka kafka-topics \
    --list \
    --bootstrap-server kafka:9092

# Consume from transactions topic
docker exec -it kafka kafka-console-consumer \
    --topic transactions \
    --from-beginning \
    --bootstrap-server kafka:9092