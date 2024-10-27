## Project Overview

**Project Title**: Trinity Stores Sales Analysis 
**Level**: Beginner  
**Database**: `Trinity_Stores_db`

This project is to examine, clean, and evaluate the sales data from Trinity Stores. This involves setting up a retail sales database, conducting exploratory data analysis (EDA), and using SQL queries to answer relevant business questions.

## Objectives

1. **Establish a Retail Sales Database**: Create and populate the Trinity Stores database using the 2022 - 2023 sales data.
2. **Data Cleaning**: Identify and eliminate any records containing missing or null values.
3. **Exploratory Data Analysis (EDA)**: Conduct basic exploratory data analysis to gain insights into the dataset.
4. **Business Analysis**: Answer specific business questions and extract insights from the retail sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The first step of the project is to create a database named `Trinity_Stores_db`.
- **Table Creation**: I created a table named `retail_trade` to store the imported csv sales data. Transaction ID, sale time, sale date, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount are all columns in the table's structure.

```sql
CREATE DATABASE Trinity_Stores_db;

CREATE TABLE retail_trade
(

    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT

);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Calculate the total number of records in the dataset.
- **Customer Count**: Determine the number of unique customers in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Search for any null values in the dataset and remove missing data records.

```sql

SELECT COUNT(*) FROM retail_trade;
SELECT COUNT(DISTINCT customer_id) FROM retail_trade;
SELECT DISTINCT category FROM retail_trade;

SELECT * FROM retail_trade
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_trade
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-10-01**:
   
```sql
SELECT *
FROM retail_trade
WHERE sale_date = '2022-10-01';
```

2. **Write a SQL query to find all transactions where the total_sale is greater than 600.**:

```sql
SELECT * FROM retail_trade
WHERE total_sale > 600
ORDER BY total_sale;
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:

```sql
SELECT category,
		SUM (total_sale) as Total_Sales,
		COUNT(*) as Total_Orders
FROM retail_trade
GROUP BY category
ORDER BY category;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:

```sql
SELECT 
    category, 
    ROUND(AVG(age),2) AS Average_Age
FROM retail_trade
WHERE category = 'Beauty'
GROUP BY category;
```


5. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:

```sql
SELECT *
FROM retail_trade
WHERE category = 'Clothing'
AND
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
AND quantity >= '4';
```

6. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
SELECT
    year,
    month,
    average_sale
FROM
	(
    SELECT 
        EXTRACT (YEAR FROM sale_date) as year,
        EXTRACT (MONTH FROM sale_date) as month,
        AVG(total_sale) as Average_Sale,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale)DESC) as Rank
    FROM retail_trade
		GROUP BY Year, Month
	) 	as Table_1

	WHERE rank = 1
```


7. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:

```sql
SELECT 
    category,
    gender, COUNT(transactions_id) as Total_Transactions
FROM retail_trade
GROUP BY 
    category, gender
ORDER BY category;
```


8. **A need for a SQL query to identify shifts with the most orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:

```sql
WITH hourly_sale
	AS
	(
	SELECT *,
		CASE 
			WHEN EXTRACT (HOUR FROM sale_time) < 12 THEN 'Morning'
			WHEN EXTRACT (HOUR FROM sale_time) Between 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS SHIFT
	FROM retail_trade
	)
SELECT
		Shift,
		COUNT(*) AS total_order
FROM hourly_sale
GROUP BY shift
ORDER BY total_order;
```


9. **Write a SQL query to find the top 10 customers based on the highest total sales **:

```sql
SELECT
    customer_id,
    SUM (total_sale) as total_sale
FROM retail_trade
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 10;
```

10. **Write a SQL query to find the number of unique customers who purchased items from each category.**:

```sql
	SELECT
		category,
		COUNT (DISTINCT customer_id) AS unique_customers
	FROM retail_trade
	GROUP BY category;
```

## Findings

- **Sales Time**: More than 50% of total purchases occurred in the evening, specifically between 17:01 and 23:59.
- **High-Value Transactions**: Several transactions exceeded a total sale amount of $600, indicating premium purchases.
- **Customer Demographics**: The dataset encompasses customers from various age groups, with sales spread across diverse categories such as footwears and beauty products. 
- **Customer Insights**: The analysis highlights the top-spending customers and the most popular product categories.
- **Sales Trends**: Monthly analysis reveal fluctuations in sales, which help identify peak seasons.  


## Conclusion

The insights from this project guided business decisions regarding sales trends, timing, and enhanced our understanding of Trinity Stores' sales patterns, customer behavior, and product performance.


