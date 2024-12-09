### ELT data pipeline

## Introduction
 This project focuses on building an ELT data pipeline that extracts data from various sources, loads it into a target database, and
 transforms it into a format based on analysis requirements. Docker is used to set up PostgreSQL database.

1. Extract data from Kaggle.
2. Load extracted data into PostgreSQL.
3. Transformed data in PostgreSQL using dbt.

## Deployment

First, start the MinIO, MySQL, and PostgreSQL containers. During this process, raw data is also uploaded to MySQL

``` bash
  docker-compose up -d
```
 Create a virtual environment and install neccesary libraries.
``` bash
  python3 -m venv venv

  source venv/bin/activate

  pip install -r requirements
```
Run
``` bash
dbt build
```

## Tech Stack

**Data Transformation:** dbt

**Database and Data Storage:** PostgreSQL
