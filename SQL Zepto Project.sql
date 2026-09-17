CREATE DATABASE Zepto_SQL_Project;

-- Select database
USE Zepto_SQL_Project;

-- Drop table if it already exists
DROP TABLE IF EXISTS zepto;

-- Create table
CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

-- ============================================
-- DATA EXPLORATION
-- ============================================

-- Count of rows
SELECT COUNT(*) 
FROM zepto;


-- Sample data
SELECT * 
FROM zepto
LIMIT 10;

-- Find NULL values
SELECT * 
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;
   
   -- Different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- Products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outOfStock;


-- Product names present multiple times
SELECT name, COUNT(sku_id) AS `Number of SKUs`
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;


-- ============================================
-- DATA CLEANING
-- ============================================
-- Products with price = 0
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;


-- Delete products where MRP is 0
DELETE FROM zepto
WHERE mrp = 0;


-- Convert paise to rupees
SET SQL_SAFE_UPDATES = 0;

UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

SET SQL_SAFE_UPDATES = 1;

-- Check converted prices
SELECT mrp, discountedSellingPrice
FROM zepto;

-- ============================================
-- DATA ANALYSIS
-- ============================================

-- Q1. Find the top 10 best-value products
-- based on discount percentage

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2. What are the products with high MRP
-- but are out of stock?

SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Calculate estimated revenue for each category

SELECT 
    category,
    SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;


-- Q4. Find all products where MRP is greater
-- than ₹500 and discount is less than 10%

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering
-- the highest average discount percentage

SELECT 
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- Q6. Find the price per gram for products
-- above 100g and sort by best value
SELECT DISTINCT 
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms, 2) 
        AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;


-- Q7. Group the products into categories
-- like Low, Medium, Bulk

SELECT DISTINCT 
    name,
    weightInGms,
    CASE 
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
         ELSE 'Bulk'
    END AS weight_category
FROM zepto;


-- Q8. What is the total inventory weight per category?

SELECT 
    category,
    SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;