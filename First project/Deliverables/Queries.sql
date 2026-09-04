SELECT * FROM orders;

-- Add column only if it doesn't exist
ALTER TABLE orders
ADD COLUMN profit_margin DECIMAL(10,2);

-- Update profit_margin only where sales > 0
UPDATE orders
SET profit_margin = ROUND((profit / sales) * 100, 2)
WHERE sales IS NOT NULL AND sales <> 0;

SELECT Category, "Sub-Category",
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND(AVG(CASE WHEN sales <> 0 THEN (profit/sales)*100 END),2) AS avg_margin
FROM orders
GROUP BY Category, "Sub-Category";

SELECT o.Category, COUNT("r.Order ID") AS returns_count
FROM orders o
LEFT JOIN returns r ON "o.Order_ID" = "r.Order_ID"
GROUP BY o.Category;

SELECT DATE_FORMAT("Order Date", "%Y-%m") AS month_year,
       SUM(Sales) AS monthly_sales,
       SUM(Profit) AS monthly_profit
FROM orders;