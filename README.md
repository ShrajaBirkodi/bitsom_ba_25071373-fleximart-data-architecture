# FlexiMart Data Architecture Project

**Student Name:** Shraja Birkodi
**Student ID:** bitsom_ba_25071373
**Email:** shraja.birkodi9705@gmail.com
**Date:** 07 January 2026


## Project Overview

This project implements an end-to-end data architecture solution for FlexiMart, covering relational databases, NoSQL storage, and a dimensional data warehouse. The solution includes data ingestion using ETL pipelines, MongoDB-based product analytics, star schema design, and OLAP queries to support business decision-making.

## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

Designed and implemented a star schema optimized for analytical queries.
Built an ETL pipeline to clean and load CSV data into MySQL.
Performed NoSQL analytics using MongoDB and aggregation pipelines.
Wrote OLAP queries for drill-down analysis, product performance, and customer segmentation.
Understood the role of data warehouses in business intelligence.

## Challenges Faced

1. Foreign key constraint issues during ETL execution
Solution: Ensured correct load order and validated referential integrity.

2. Date format mismatches during data loading
Solution: Standardized date formats to ISO (YYYY-MM-DD) across all scripts.

3. MongoDB connection errors
Solution: Verified MongoDB service status and configured correct local connections.

