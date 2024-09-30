# Customer-Behaviour-Analysis-MSSQL-Server
# MSSQL

![image]


This project, part of a case study available here![link]((https://8weeksqlchallenge.com/case-study-1/)), focuses on analyzing customer spending patterns, trends, and influencing factors to gain insights into their preferences, purchasing habits, and potential areas for improvement in menu offerings or marketing strategies for a dining establishment.

## Background
At the beginning of 2021, Danny, a passionate lover of Japanese cuisine, decided to take a risk and open a charming little restaurant featuring his three favorite dishes: sushi, curry, and ramen. Danny’s Diner needs your help to stay afloat. Although the restaurant has collected some basic data from its initial months of operation, they are unsure how to utilize this data to improve their business.

## Problem Statement
Danny aims to use the data to answer several key questions about his customers, particularly regarding their visiting patterns, spending habits, and favorite menu items. Understanding these aspects will enable him to provide a better and more personalized experience for his loyal customers.

He plans to use these insights to determine whether to expand the existing customer loyalty program. Additionally, he needs assistance in generating basic datasets so his team can easily inspect the data without needing to use SQL.

Due to privacy concerns, Danny has provided a sample of his overall customer data. He hopes these examples will be sufficient for you to write fully functioning SQL queries to help answer his questions.

## Entity Relationship
![image](https://github.com/frankie323/Data-Analysis-Portfolio/blob/main/Assets/Entity%20Relationship.png)

## Some insightful queries
** Danny also needs additional information regarding product rankings. He specifically does not require rankings for non-member purchases, so he expects NULL values for customers who are not part of the loyalty program.

```sql
WITH customers_data AS (
  SELECT 
    s.customer_id, s.order_date,  m.product_name, m.price,
    CASE
      WHEN s.order_date < mb.join_date THEN 'N'
      WHEN s.order_date >= mb.join_date THEN 'Y'
      ELSE 'N' END AS member
  FROM sales s
  LEFT JOIN members mb
    ON s.customer_id = mb.customer_id
  JOIN menu m
    ON s.product_id = m.product_id
)
SELECT 
  *, 
  CASE
    WHEN member = 'N' THEN NULL
    ELSE RANK () OVER(
      PARTITION BY customer_id, member
      ORDER BY order_date) END AS ranking
FROM customers_data
ORDER BY customer_id, order_date;
```
** Danny also needs additional information about product rankings. He specifically does not require rankings for non-member purchases, so he expects NULL values for customers who are not part of the loyalty program. **

```sql
WITH customers_data AS (
  SELECT 
    s.customer_id, s.order_date,  m.product_name, m.price,
    CASE
      WHEN s.order_date >= mb.join_date THEN 'Y'
      WHEN s.order_date < mb.join_date THEN 'N'
      ELSE 'N' END AS member
  FROM sales s
  LEFT JOIN members mb
    ON s.customer_id = mb.customer_id
  JOIN menu m
    ON s.product_id = m.product_id
)
SELECT 
  *, 
  CASE
    WHEN member = 'N' THEN NULL
    ELSE RANK () OVER(
      PARTITION BY customer_id, member
      ORDER BY order_date) END AS ranking
FROM customers_data
ORDER BY customer_id, order_date;
```
** Which item was the most popular for each customer? **

```sql
WITH customer_popularity AS (
    SELECT s.customer_id, m.product_name, COUNT(*) AS purchase_count,
        DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY COUNT(*) DESC) AS rank
    FROM dbo.sales s
    INNER JOIN dbo.menu m ON s.product_id = m.product_id
    GROUP BY s.customer_id, m.product_name
)
SELECT customer_id, product_name, purchase_count
FROM customer_popularity
WHERE rank = 1;
```

## Insights

- The last items ordered by Customers A and B before becoming members were sushi and curry, respectively. Could these items be the deciding factors?
- Customer B visited most frequently in January 2021, with a total of 6 visits.
- Customer A loves ramen, Customer C exclusively loves ramen, while Customer B enjoys sushi, curry, and ramen equally.
- The most popular item at Danny’s Diner is ramen, followed by curry and sushi.

