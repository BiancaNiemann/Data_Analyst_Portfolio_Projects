# Omnichannel Project

This project demonstrates an end-to-end **data pipeline** and visualization workflow for an e-commerce dataset.

---

## Tools Used
- **BigQuery**
- **dbt Core** (on VS Code)
- **Airflow**
- **Looker Studio**

---

## dbt Core & BigQuery

### Setup
1. Created a BigQuery database called `raw_ecomm_project`.
2. Created a **service account** and generated a JSON key to connect dbt Core in VS Code via the `profiles.yml` file.
3. Installed dbt Core locally using `dbt init` in VS Code to:
   - Connect to BigQuery
   - Source raw files
   - Upload transformed tables/views to BigQuery under the folder `dbt_ecomm_project`.

### Raw Data Upload
- **Files used:**
  - `raw_wallmart.csv` (from Masterschool)
  - `raw_ecomm.csv` (from Kaggle)

#### `raw_wallmart` Schema

| Column | Type |
|--------|------|
| transaction_id | INT64 |
| customer_id | INT64 |
| product_id | INT64 |
| product_name | STRING |
| category | STRING |
| quantity_sold | INT64 |
| unit_price | FLOAT64 |
| transaction_date | TIMESTAMP |
| store_id | INT64 |
| store_location | STRING |
| inventory_level | INT64 |
| reorder_point | INT64 |
| reorder_quantity | INT64 |
| supplier_id | INT64 |
| supplier_lead_time | INT64 |
| customer_age | INT64 |
| customer_gender | STRING |
| customer_income | FLOAT64 |
| customer_loyalty_level | STRING |
| payment_method | STRING |
| promotion_applied | BOOL |
| promotion_type | STRING |
| weather_conditions | STRING |
| holiday_indicator | BOOL |
| weekday | STRING |
| stockout_indicator | BOOL |
| forecasted_demand | INT64 |
| actual_demand | INT64 |

#### `raw_ecomm` Schema

| Column | Type |
|--------|------|
| customer_id | STRING |
| first_name | STRING |
| last_name | STRING |
| gender | STRING |
| age_group | STRING |
| signup_date | DATE |
| country | STRING |
| product_id | STRING |
| product_name | STRING |
| category | STRING |
| quantity | INT64 |
| unit_price | INT64 |
| order_id | STRING |
| order_date | DATE |
| order_status | STRING |
| payment_method | STRING |
| rating | INT64 |
| review_text | STRING |
| review_id | STRING |
| review_date | DATE |

### dbt Modeling

**Staging Models:**
- Folder: `models/staging/`
- Files:
  - `stg_sources.yml`
  - `stg_schema.yml`
  - `stg_ecomm.sql`
  - `stg_wallmart.sql`

**Tasks performed:**
- Selected relevant columns
- Checked for nulls and duplicates
- Verified correct data types
- Created missing columns (`store_id`, `store_location`, `supplier_id`)
- Normalized categories and enhanced uniqueness of IDs

**Intermediate Models:**
- Folder: `models/intermediate/`
- Files:
  - `int_schema.yml`
  - `int_unioned_orders.yml`
- Actions:
  - Unified the two raw datasets
  - Extracted relevant columns
  - Generated surrogate keys using `MD5` for columns without IDs

**Mart Models:**
- Folder: `models/marts/`
- Files:
  - `marts_schema.yml`
  - `dim_customer.sql`
  - `dim_dates.sql`
  - `dim_order_status.sql`
  - `dim_payment_methods.sql`
  - `dim_products.sql`
  - `dim_stores.sql`
  - `fact_orders.sql`
- Based on a **star schema ERD** created in Canva.

- Created tests and macros for data quality
- Generated documentation using:
  ```bash
  dbt docs generate
  dbt docs serve --port 8081

## Airflow

**Purpose:** Workflow orchestration using DAGs (Directed Acyclic Graphs).

- Setup using **Astro** in VS Code via Docker
- Project created: `dbt_ecomm_pipeline`
- Learned to debug and orchestrate **dbt transformations**
- Verified success of table creation and uploads in **BigQuery**

---

## Looker Studio – Visualization

**Steps:**

1. Created a BigQuery table with required columns for visualization
2. Used **LEFT JOINs** to connect dimension tables to the fact table
3. Created a dashboard with:
   - **KPIs:** total customers, total revenue, average sale amount
   - Parameter to toggle between sales amount or quantity
   - Drop-down filters: date, age group, store type

---

## Project Highlights

- End-to-end **data pipeline**: ingestion → transformation → orchestration → visualization
- Hands-on experience with **dbt**, **BigQuery**, **Airflow**, and **Looker Studio**
- Practical application of **star schema** and **data quality checks**
