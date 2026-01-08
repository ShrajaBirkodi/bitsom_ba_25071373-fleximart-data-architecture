# Star Schema Design – FlexiMart Data Warehouse

## Section 1: Schema Overview

The FlexiMart data warehouse follows a **star schema** design to support efficient analytical queries on historical sales data.

### Fact Table: fact_sales
- **Grain:** One row per product per order line item
- **Business Process:** Sales transactions

#### Measures (Numeric Facts):
- quantity_sold – Number of units sold
- unit_price – Price per unit at time of sale
- discount_amount – Discount applied on the line item
- total_amount – Final sales amount  
  (quantity_sold × unit_price − discount_amount)

#### Foreign Keys:
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### Dimension Table: dim_date
- **Purpose:** Enables time-based analysis
- **Type:** Conformed dimension

**Attributes:**
- date_key (PK) – Surrogate key (YYYYMMDD)
- full_date – Actual calendar date
- day_of_week – Monday, Tuesday, etc.
- month – 1 to 12
- month_name – January, February, etc.
- quarter – Q1, Q2, Q3, Q4
- year – 2023, 2024, etc.
- is_weekend – Boolean flag

---

### Dimension Table: dim_product
- **Purpose:** Product-level analysis

**Attributes:**
- product_key (PK) – Surrogate key
- product_id – Business product ID
- product_name
- category
- subcategory
- brand
- price_range

---

### Dimension Table: dim_customer
- **Purpose:** Customer segmentation and behavior analysis

**Attributes:**
- customer_key (PK) – Surrogate key
- customer_id
- customer_name
- city
- state
- country
- customer_segment

---

## Section 2: Design Decisions

The star schema is designed at the **transaction line-item level** to provide maximum analytical flexibility. This level of granularity allows analysts to drill down into individual product sales while still supporting roll-ups to daily, monthly, or yearly summaries.

Surrogate keys are used instead of natural keys to improve join performance and handle changes in dimension attributes without affecting historical fact data. This approach also simplifies Slowly Changing Dimension (SCD) management.

The schema supports efficient **drill-down and roll-up operations** by separating measurable facts from descriptive attributes. Analysts can aggregate sales by time, product category, or customer segment without complex joins, enabling faster reporting and better business insights.

---

## Section 3: Sample Data Flow

### Source Transaction:
Order #101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50000  

### Loaded into Data Warehouse:

**fact_sales**
