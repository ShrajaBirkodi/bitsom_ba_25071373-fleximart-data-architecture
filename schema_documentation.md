# Database Schema Documentation – FlexiMart

## 1. Entity–Relationship Description

### ENTITY: Customers
**Purpose:**  
Stores customer personal and registration information.

**Attributes:**
- `customer_id` – Unique identifier for each customer (Primary Key)
- `first_name` – Customer’s first name
- `last_name` – Customer’s last name
- `email` – Customer’s email address
- `phone` – Customer’s contact number
- `city` – City of residence
- `registration_date` – Date when the customer registered

**Relationships:**
- One customer can place **many orders**
- Relationship type: **1-to-Many** (Customers → Orders)

---

### ENTITY: Products
**Purpose:**  
Stores information about products sold on the platform.

**Attributes:**
- `product_id` – Unique identifier for each product (Primary Key)
- `product_name` – Name of the product
- `category` – Product category (Electronics, Fashion, Groceries)
- `price` – Price of the product
- `stock_quantity` – Available stock

**Relationships:**
- Products are referenced in orders indirectly through sales transactions

---

### ENTITY: Orders
**Purpose:**  
Stores order-level transaction details.

**Attributes:**
- `order_id` – Unique identifier for each order (Primary Key)
- `customer_id` – References the customer who placed the order (Foreign Key)
- `order_date` – Date of the order
- `total_amount` – Total value of the order
- `status` – Order status (Completed, Pending, Cancelled)

**Relationships:**
- Many orders belong to **one customer**
- Relationship type: **Many-to-One** (Orders → Customers)

---

### ENTITY: Order_Items
**Purpose:**  
Stores individual items within each order.

**Attributes:**
- `order_item_id` – Unique identifier (Primary Key)
- `order_id` – References the order (Foreign Key)
- `product_id` – References the product (Foreign Key)
- `quantity` – Quantity ordered
- `unit_price` – Price per unit
- `subtotal` – Quantity × Unit Price

**Relationships:**
- One order can have **many order items**
- One product can appear in **many order items**

---

## 2. Normalization Explanation (3NF)

The database schema is designed following **Third Normal Form (3NF)** principles to eliminate redundancy and maintain data integrity.

**First Normal Form (1NF):**
- All tables contain atomic values.
- No repeating groups or multi-valued attributes exist.
- Each record is uniquely identifiable using a primary key.

**Second Normal Form (2NF):**
- All non-key attributes are fully dependent on the primary key.
- Composite dependencies are eliminated by separating data into related tables such as Orders and Order_Items.

**Third Normal Form (3NF):**
- There are no transitive dependencies.
- Customer details are stored only in the Customers table.
- Product details are stored only in the Products table.
- Order and order item details depend solely on their respective primary keys.

**Anomaly Prevention:**
- **Insert anomalies** are avoided by separating customers and products from orders.
- **Update anomalies** are prevented since data is stored only once.
- **Delete anomalies** are avoided because deleting an order does not remove customer or product information.

Thus, the schema satisfies all conditions of **3NF**.

---

## 3. Sample Data Representation

### Customers Table
| customer_id | first_name | last_name | city       | registration_date |
|------------|-----------|-----------|-----------|-------------------|
| 1          | Rahul     | Sharma    | Bangalore | 2023-01-15        |
| 2          | Priya     | Patel     | Mumbai    | 2023-02-20        |

---

### Products Table
| product_id | product_name        | category     | price  | stock_quantity |
|-----------|--------------------|-------------|--------|----------------|
| 1         | Samsung Galaxy S21 | Electronics | 45999  | 150            |
| 2         | Nike Running Shoes | Fashion     | 3499   | 80             |

---

### Orders Table
| order_id | customer_id | order_date | total_amount | status     |
|---------|-------------|------------|--------------|-----------|
| 1       | 1           | 2024-01-15 | 45999        | Completed |
| 2       | 2           | 2024-01-16 | 5998         | Completed |

---

### Order_Items Table
| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|--------------|----------|------------|----------|-----------|----------|
| 1            | 1        | 1          | 1        | 45999     | 45999    |
| 2            | 2        | 2          | 2        | 2999      | 5998     |
