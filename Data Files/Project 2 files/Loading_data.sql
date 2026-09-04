USE ecommerce_data;

SET GLOBAL local_infile = 1;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/users.csv'
INTO TABLE users
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(user_id, name, age, gender, country, signup_date);

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/suppliers.csv'
INTO TABLE suppliers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(supplier_id, supplier_name, country);

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/products.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(product_id, product_name, category, supplier_id, retail_price);

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(order_id, user_id, order_date, status);

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/order_items.csv'
INTO TABLE order_items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(order_id, product_id, quantity, unit_price, total_price);

LOAD DATA LOCAL INFILE
'C:/Disk Partition/datax-labs/Project Phase/Phase 1.2/Synthetic data/returns.csv'
INTO TABLE `returns`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(order_id, user_id, order_date, status, return_reason, refund_amount);