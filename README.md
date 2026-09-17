# SQL-Zepto-Project
SQL-based analysis of Zepto product data to clean, transform, and extract insights on pricing, discounts, inventory, and product categories.

# Zepto SQL Data Analysis

## 📌 Project Overview

This project analyzes a Zepto product dataset using **MySQL and SQL** to understand product pricing, discounts, inventory, stock availability, and category-level trends.

The project covers the complete data analysis workflow, starting from importing the dataset into MySQL, cleaning and transforming the data, and finally executing SQL queries to extract meaningful business insights.

## 📊 Dataset

The dataset was obtained from **Kaggle** and contains product-level information from Zepto.

Key columns include:

* `sku_id` – Unique product identifier
* `category` – Product category
* `name` – Product name
* `mrp` – Maximum Retail Price
* `discountPercent` – Discount percentage
* `availableQuantity` – Available quantity
* `discountedSellingPrice` – Selling price after discount
* `weightInGms` – Product weight in grams
* `outOfStock` – Stock availability status

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* **MySQL Workbench**
* **Kaggle Dataset**

## 🔄 Project Workflow

### 1. Data Import

The Kaggle CSV dataset was imported into MySQL using the **Table Data Import Wizard**.

### 2. Data Cleaning

The dataset was checked for:

* Missing values
* Duplicate records
* Invalid or zero prices
* Incorrect data types
* Inconsistent data during import

The data was then cleaned and prepared for analysis.

### 3. Data Transformation

Price values were converted into the appropriate currency representation.

For example:

```sql
UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;
```

### 4. Exploratory Data Analysis

SQL queries were used to investigate:

* Product pricing
* Discount percentages
* Category-wise pricing
* Product availability
* Out-of-stock products
* Product weights
* Discounted selling prices
* Revenue-related metrics
* Inventory-related patterns

## 🔍 Key SQL Analysis

Some of the questions explored in the project include:

1. Which products have the highest discounts?
2. Which products have a high MRP but are currently out of stock?
3. What is the average discount percentage across categories?
4. Which categories contain the highest-priced products?
5. Which products provide the highest discount amounts?
6. How does product weight relate to price?
7. Which products are currently available or out of stock?
8. What are the pricing and inventory patterns across different categories?

## 📁 Project Structure

```text
Zepto-SQL-Data-Analysis/
│
├── dataset/
│   └── zepto.csv
│
├── sql/
│   └── zepto_analysis.sql
│
├── README.md
└── screenshots/
```

## 📈 Insights

The SQL analysis provides insights into:

* Product pricing and discount patterns
* Category-level differences
* Stock availability
* High-value products
* Product weight and pricing
* Inventory distribution

These insights can help understand **pricing strategies, product availability, and inventory patterns** in an e-commerce environment.

## 🎯 Learning Outcomes

Through this project, I practiced:

* Creating and modifying MySQL tables
* Importing CSV datasets into MySQL
* Data cleaning using SQL
* Handling data types
* `SELECT`, `WHERE`, `GROUP BY`, and `ORDER BY`
* Aggregate functions such as `AVG()`, `SUM()`, `COUNT()`, `MIN()`, and `MAX()`
* `CASE` statements
* Filtering grouped data using `HAVING`
* SQL calculations and transformations
* Exploratory data analysis using SQL

## 👩‍💻 Author

**Bhavana Dodamani**

* GitHub: [BhavanaD810](https://github.com/BhavanaD810)
* LinkedIn: [Bhavana Dodamani](https://www.linkedin.com/in/bhavana-dodamani-12a963383/)
