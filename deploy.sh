#!/bin/bash
# Ensures the latest containers are running
docker-compose down
docker-compose pull
docker-compose up -d
