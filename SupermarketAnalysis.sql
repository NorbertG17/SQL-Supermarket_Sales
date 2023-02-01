---CREATE TABLE

CREATE TABLE supermarket(
    branch VARCHAR,
    city VARCHAR,
    customer VARCHAR,
    gender VARCHAR,
    product_line VARCHAR,
    unit_price DECIMAL,
    quantity INT,
    total DECIMAL,
    date_ DATE,
    payment DECIMAL
);

---
--- Which month had the highest sales?

SELECT EXTRACT(MONTH FROM date_)AS month ,ROUND(SUM(total),2) AS total_in_$ 
FROM supermarket
GROUP BY month
ORDER BY total_in_$ DESC;

---
--- Total sales amounts based on products categories.

SELECT product_line,SUM(total) AS total_sum 
FROM supermarket
GROUP BY product_line
ORDER BY total_sum DESC;

---
--- Total sales based on gender and products categories.

SELECT gender,product_line,SUM(total) AS total_sales 
FROM supermarket 
GROUP BY gender,product_line
ORDER BY total_sales DESC;

---
--- What is the most popular way of payment based on gender and customer type.

SELECT gender,customer,
COUNT (CASE WHEN payment = 'Ewallet' THEN 1 END) AS Ewallet,
COUNT (CASE WHEN payment = 'Cash' THEN 1 END) AS Cash,
COUNT (CASE WHEN payment = 'Credit card' THEN 1 END) AS Credit_card
FROM supermarket
GROUP BY gender,customer;

---
--- Average spending by gender on each category of product

SELECT gender,product_line,ROUND(AVG(total),2) AS average_spending 
FROM supermarket
GROUP BY gender,product_line
ORDER BY gender,average_spending DESC;

---
--- How many products were bought from each category each day

SELECT date_,
ROUND(AVG(CASE WHEN product_line = 'Health and beauty' THEN total_products END),0)
AS Health_and_beauty,
ROUND(AVG(CASE WHEN product_line = 'Electronic accessories' THEN total_products END),0) 
AS Electronic_accessories,
ROUND(AVG(CASE WHEN product_line = 'Fashion accessories' THEN total_products END),0) 
AS Fashion_accessories,
ROUND(AVG(CASE WHEN product_line = 'Food and beverages' THEN total_products END),0) 
AS Food_and_bevarages,
ROUND(AVG(CASE WHEN product_line = 'Sports and travel' THEN total_products END),0) 
AS Sports_and_travel,
ROUND(AVG(CASE WHEN product_line = 'Home and lifestyle' THEN total_products END),0) 
AS Home_and_lifestyle
FROM
(SELECT date_,SUM(quantity) AS total_products,product_line FROM supermarket
GROUP BY date_,product_line
ORDER BY date_) AS sub
GROUP BY date_;

---
--- Average spending by one customer in each city

SELECT date_,city,gender,ROUND(AVG(total),2) AS average_spending FROM supermarket
GROUP BY date_,city,gender
ORDER BY date_

