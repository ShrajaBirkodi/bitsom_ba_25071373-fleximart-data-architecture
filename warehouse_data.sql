INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,FALSE),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,FALSE),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,FALSE),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,FALSE),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,FALSE),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,TRUE),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,TRUE),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,FALSE),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,FALSE),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,FALSE),

(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,FALSE),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,TRUE),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,FALSE),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,FALSE),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,FALSE),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,TRUE),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,TRUE),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,FALSE),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,FALSE),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,FALSE),

(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,TRUE),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,TRUE),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,FALSE),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,FALSE),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,FALSE),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,FALSE),
(20240216,'2024-02-16','Friday',16,2,'February','Q1',2024,FALSE),
(20240217,'2024-02-17','Saturday',17,2,'February','Q1',2024,TRUE),
(20240218,'2024-02-18','Sunday',18,2,'February','Q1',2024,TRUE);

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Laptops',75000),
('P002','Smartphone X','Electronics','Mobiles',45000),
('P003','Bluetooth Headphones','Electronics','Audio',8000),
('P004','Smart TV 55 inch','Electronics','Television',65000),
('P005','Wireless Mouse','Electronics','Accessories',1200),

('P006','Men T-Shirt','Fashion','Clothing',1499),
('P007','Women Jeans','Fashion','Clothing',2499),
('P008','Running Shoes','Fashion','Footwear',4999),
('P009','Leather Wallet','Fashion','Accessories',1999),
('P010','Winter Jacket','Fashion','Outerwear',6999),

('P011','Rice 5kg','Grocery','Food Grains',650),
('P012','Cooking Oil 1L','Grocery','Essentials',180),
('P013','Sugar 1kg','Grocery','Essentials',60),
('P014','Tea Powder','Grocery','Beverages',450),
('P015','Coffee Powder','Grocery','Beverages',550);

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Amit Sharma','Mumbai','Maharashtra','Regular'),
('C002','Neha Verma','Delhi','Delhi','Premium'),
('C003','Rahul Mehta','Bangalore','Karnataka','Regular'),
('C004','Priya Iyer','Chennai','Tamil Nadu','Premium'),

('C005','Karan Singh','Mumbai','Maharashtra','Occasional'),
('C006','Sneha Kapoor','Delhi','Delhi','Regular'),
('C007','Vikram Rao','Bangalore','Karnataka','Premium'),
('C008','Ananya Das','Chennai','Tamil Nadu','Regular'),

('C009','Rohit Jain','Mumbai','Maharashtra','Premium'),
('C010','Pooja Malhotra','Delhi','Delhi','Occasional'),
('C011','Suresh Kumar','Bangalore','Karnataka','Regular'),
('C012','Meera Nair','Chennai','Tamil Nadu','Premium');

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,1,75000,5000,70000),
(20240102,2,2,1,45000,3000,42000),
(20240103,3,3,2,8000,0,16000),
(20240104,4,4,1,65000,4000,61000),
(20240105,5,5,3,1200,0,3600),

(20240106,6,6,2,1499,0,2998),
(20240107,7,7,1,2499,0,2499),
(20240108,8,8,1,4999,500,4499),
(20240109,9,9,2,1999,0,3998),
(20240110,10,10,1,6999,1000,5999),

(20240115,11,11,5,650,0,3250),
(20240120,12,12,4,180,0,720),
(20240125,13,1,6,60,0,360),

(20240201,14,2,2,450,0,900),
(20240202,15,3,2,550,0,1100),
(20240203,1,4,1,75000,6000,69000),
(20240204,2,5,1,45000,2000,43000),
(20240205,3,6,3,8000,0,24000),
(20240206,4,7,1,65000,5000,60000),
(20240207,5,8,4,1200,0,4800),

(20240210,6,9,2,1499,0,2998),
(20240211,7,10,1,2499,0,2499),
(20240212,8,11,1,4999,500,4499),
(20240213,9,12,2,1999,0,3998),
(20240214,10,1,1,6999,1000,5999),

(20240215,11,2,3,650,0,1950),
(20240216,12,3,2,180,0,360),
(20240217,13,4,4,60,0,240),
(20240218,14,5,1,450,0,450),
(20240201,15,6,1,550,0,550),

(20240103,2,7,1,45000,2500,42500),
(20240104,1,8,1,75000,7000,68000),
(20240105,3,9,2,8000,0,16000),
(20240106,4,10,1,65000,3000,62000),
(20240107,5,11,5,1200,0,6000),
(20240108,6,12,2,1499,0,2998),
(20240109,7,1,1,2499,0,2499),
(20240110,8,2,1,4999,500,4499),
(20240115,9,3,2,1999,0,3998);
