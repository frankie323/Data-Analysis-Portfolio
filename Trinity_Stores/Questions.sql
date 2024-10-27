
-- Create Table --
DROP TABLE IF EXISTS retail_trade;
Create Table retail_trade
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id	INT,
		gender VARCHAR(15),
		age	INT,
		category VARCHAR(15),
		quantity	INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
	);

	SELECT * FROM retail_trade;

	-- Exploration--

	SELECT * FROM retail_trade
		WHERE transactions_id IS NULL
		OR
		sale_time IS NULL
		OR
		sale_date IS NULL
		OR
		customer_id IS NULL
		OR
		gender IS NULL
		OR
		age IS NULL
		OR
		category IS NULL
		OR
		quantity IS NULL
		OR
		price_per_unit IS NULL
		OR
		cogs IS NULL
		OR
		total_sale IS NULL;

	SELECT transactions_id, COALESCE (age,55 )
	FROM retail_trade;

	update retail_trade set age = 46 where transactions_id=2055;

-- Delete Null Rows--

	DELETE FROM retail_trade
			WHERE transactions_id IS NULL
			OR
			sale_time IS NULL
			OR
			sale_date IS NULL
			OR
			customer_id IS NULL
			OR
			gender IS NULL
			OR
			age IS NULL
			OR
			category IS NULL
			OR
			quantity IS NULL
			OR
			price_per_unit IS NULL
			OR
			cogs IS NULL
			OR
			total_sale IS NULL;

-- Count Records --
SELECT
	COUNT(*)
FROM retail_trade

-- Data Exploration --

-- Total number of records --

SELECT COUNT(*) as total_sales
	FROM retail_trade;

-- Total number of unique customers --
SELECT COUNT(DISTINCT customer_id) as customer_count
	FROM retail_trade;

-- Total number of categories --
SELECT COUNT(DISTINCT category) as category_count
	FROM retail_trade;

-- Total number of categories --
SELECT DISTINCT category as category_names
	FROM retail_trade;
	
update retail_trade set category = 'Footwears' where transactions_id=95;

-- Business Problems --
-- 1. **Write a SQL query to retrieve all columns for sales made on '2022-12-05**:

	SELECT *
	FROM retail_trade
	WHERE sale_date = '2022-10-01';
	
-- 2. **Write a SQL query to find all transactions where the total_sale is greater than 600.**:
	
	SELECT *
	FROM retail_trade
	WHERE total_sale > 600
	ORDER BY total_sale;
		
-- 3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
	SELECT category,
		SUM (total_sale) as Total_Sales,
		COUNT(*) as Total_Orders
	FROM retail_trade
	GROUP BY category
	ORDER BY category;

--4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
	SELECT 
		category, 
		ROUND(AVG(age),2) AS Average_Age
	FROM retail_trade
	WHERE category = 'Beauty'
	GROUP BY category;

-- 5. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
	SELECT *

	FROM retail_trade
	WHERE category = 'Clothing'
	AND
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND quantity >= '4';

-- 6. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
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
	-- ORDER BY Year, Average_Sale DESC;

	
-- 7. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
	SELECT 
		category,
		gender, COUNT(transactions_id) as Total_Transactions
	FROM retail_trade
	GROUP BY 
		category, gender
	ORDER BY category;


-- 8. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:

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
		
	
-- 9. **Write a SQL query to find the top 10 customers based on the highest total sales **:

	SELECT
		customer_id,
		SUM (total_sale) as total_sale
	FROM retail_trade
	GROUP BY customer_id
	ORDER BY total_sale DESC
	LIMIT 10;
	
-- 10. **Write a SQL query to find the number of unique customers who purchased items from each category.**:

	SELECT
		
		category,
		COUNT (DISTINCT customer_id) AS unique_customers
		--SUM (total_sale) as Total_Sale
	FROM retail_trade
	GROUP BY category;
	-- ORDER BY total_sale DESC;
-- End --
		