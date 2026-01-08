import pandas as pd

from datetime import datetime

def parse_date(date_value):
    for fmt in ("%Y-%m-%d", "%d/%m/%Y", "%m-%d-%Y", "%m/%d/%Y"):
        try:
            return datetime.strptime(str(date_value), fmt).date()
        except ValueError:
            continue
    return None


customers = pd.read_csv("customers_raw.csv")
products = pd.read_csv("products_raw.csv")
sales = pd.read_csv("sales_raw.csv")

print("Customers rows:", len(customers))
print("Products rows:", len(products))
print("Sales rows:", len(sales))
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="ShrajaSQL@05",
    database="fleximart"
)

cursor = conn.cursor()
print("Connected to MySQL")

# -----------------------------
# CLEAR TABLES (FK-SAFE ORDER)
# -----------------------------
cursor.execute("DELETE FROM orders")
cursor.execute("DELETE FROM products")
cursor.execute("DELETE FROM customers")
conn.commit()


# -----------------------------
# LOAD CUSTOMERS INTO MYSQL
# -----------------------------


for _, row in customers.iterrows():
    cursor.execute("""
        INSERT INTO customers
        (first_name, last_name, email, phone, city, registration_date)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (
        row["first_name"],
        row["last_name"],
        row["email"],
        row["phone"],
        row["city"],
        row["registration_date"]
    ))

conn.commit()
print("Customers loaded into MySQL")

# -----------------------------
# LOAD PRODUCTS INTO MYSQL
# -----------------------------

cursor.execute("DELETE FROM products")
conn.commit()

for _, row in products.iterrows():
    cursor.execute("""
        INSERT INTO products
        (product_name, category, price, stock_quantity)
        VALUES (%s, %s, %s, %s)
    """, (
        row["product_name"],
        row["category"],
        row["price"],
        row["stock_quantity"]
    ))

conn.commit()
print("Products loaded into MySQL")

# Get a valid customer_id to use for orders
cursor.execute("SELECT customer_id FROM customers LIMIT 1")
default_customer_id = cursor.fetchone()[0]

# -----------------------------
# LOAD SALES INTO MYSQL
# -----------------------------

cursor.execute("DELETE FROM orders")
conn.commit()

for _, row in sales.iterrows():
    cursor.execute(
        """
        INSERT INTO orders
        (customer_id, order_date, total_amount, status)
        VALUES (%s, %s, %s, %s)
        """,
        (
            default_customer_id,
            parse_date(row["transaction_date"]),
            row["quantity"] * row["unit_price"],
            row["status"]
        )
    )

conn.commit()
print("Sales loaded into MySQL")
