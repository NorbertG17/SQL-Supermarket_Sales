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




