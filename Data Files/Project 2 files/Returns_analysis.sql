USE ecommerce_data;

-- Checking duplicate occurences in the order_id column of orders table
SELECT order_id, COUNT(*) AS occurrences
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Checking if all product rows has a supplier
SELECT p.product_id, p.supplier_id
FROM products AS p
LEFT JOIN suppliers AS s
    ON s.supplier_id = p.supplier_id
WHERE s.supplier_id IS NULL;

-- Return rate by product category
CREATE OR REPLACE VIEW return_rate_category AS
SELECT
    p.category,
    ROUND(
        100.0 * COUNT(DISTINCT r.order_id)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS return_percentage
FROM orders AS o
JOIN order_items AS oi
    ON oi.order_id = o.order_id
JOIN products AS p
    ON p.product_id = oi.product_id
LEFT JOIN `returns` AS r
    ON r.order_id = o.order_id
GROUP BY p.category;

-- Return rate by supplier
CREATE OR REPLACE VIEW return_rate_supplier AS
SELECT
    s.supplier_id, s.supplier_name,
    ROUND(
        100.0 * COUNT(DISTINCT r.order_id)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS return_percentage
FROM orders AS o
JOIN order_items AS oi
    ON oi.order_id = o.order_id
JOIN products AS p
    ON p.product_id = oi.product_id
JOIN suppliers AS s
    ON s.supplier_id = p.supplier_id
LEFT JOIN `returns` AS r
    ON r.order_id = o.order_id
GROUP BY s.supplier_id, s.supplier_name;

-- Return rate by supplier country
CREATE OR REPLACE VIEW return_rate_country AS
SELECT
    s.country,
    ROUND(
        100.0 * COUNT(DISTINCT r.order_id)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS return_percentage
FROM orders AS o
JOIN order_items AS oi
    ON oi.order_id = o.order_id
JOIN products AS p
    ON p.product_id = oi.product_id
JOIN suppliers AS s
    ON s.supplier_id = p.supplier_id
LEFT JOIN `returns` AS r
    ON r.order_id = o.order_id
GROUP BY s.country;

-- Distribution of return reasons
CREATE OR REPLACE VIEW return_reasons AS
SELECT
    return_reason,
    COUNT(*) AS total_returns
FROM `returns`
GROUP BY return_reason;