CREATE DATABASE IF NOT EXISTS ecommerce_data;
USE ecommerce_data;

CREATE TABLE users (
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age TINYINT UNSIGNED NOT NULL,
    gender VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    signup_date DATE NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE suppliers (
    supplier_id INT NOT NULL,
    supplier_name VARCHAR(100) NOT NULL,
    country VARCHAR(30) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE products (
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    supplier_id INT NOT NULL,
    retail_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_id),
    CONSTRAINT fk_products_supplier
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity TINYINT UNSIGNED NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE returns (
    order_id INT NOT NULL,
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    return_reason VARCHAR(100) NOT NULL,
    refund_amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT fk_returns_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_returns_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);

ALTER TABLE order_items
MODIFY total_price DECIMAL(10,2) NOT NULL;

TRUNCATE TABLE order_items;

SHOW CREATE TABLE order_items;