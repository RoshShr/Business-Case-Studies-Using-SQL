-- Create Schema
CREATE DATABASE dannys_diner;

-- Use the newly created schema
USE dannys_diner;

-- Create sales table
CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INT
);

-- Insert data into sales
INSERT INTO sales (customer_id, order_date, product_id) VALUES
  ('A', '2021-01-01', 1),
  ('A', '2021-01-01', 2),
  ('A', '2021-01-07', 2),
  ('A', '2021-01-10', 3),
  ('A', '2021-01-11', 3),
  ('A', '2021-01-11', 3),
  ('B', '2021-01-01', 2),
  ('B', '2021-01-02', 2),
  ('B', '2021-01-04', 1),
  ('B', '2021-01-11', 1),
  ('B', '2021-01-16', 3),
  ('B', '2021-02-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-07', 3);

-- Create menu table
CREATE TABLE menu (
  product_id INT,
  product_name VARCHAR(50),
  price INT
);

-- Insert data into menu
INSERT INTO menu (product_id, product_name, price) VALUES
  (1, 'sushi', 10),
  (2, 'curry', 15),
  (3, 'ramen', 12);

-- Create members table
CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

-- Insert data into members
INSERT INTO members (customer_id, join_date) VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');



--======================================================================

 ## CASE STUDIES ##

--======================================================================


-- 1. What is the total amount each customer spent at the restaurant?

SELECT s.customer_id,
       sum(m.price) AS total_amount
FROM sales AS s
JOIN menu AS m USING (product_id)
GROUP BY s.customer_id;

-- 2. How many days has each customer visited the restaurant?

SELECT customer_id,
       count(DISTINCT day(order_date))
FROM sales
GROUP BY customer_id;

-- 3. What was the first item from the menu purchased by each customer?

SELECT s.customer_id,
       m.product_name,
       s.order_date
FROM sales s
JOIN menu m USING (product_id)
WHERE (customer_id,
       order_date) IN
    (SELECT customer_id,
            min(order_date)
     FROM sales
     GROUP BY customer_id);

-- 4. What is the most purchased item on the menu and how many times was it purchased by all
-- customers?

SELECT m.product_name,
       count(s.product_id) AS times
FROM sales AS s
JOIN menu AS m USING (product_id)
GROUP BY m.product_name
ORDER BY times DESC;

-- 5. Which item was the most popular for each customer?
WITH product_counts AS
  (SELECT s.customer_id,
          m.product_name,
          count(s.product_id) AS purchase_count
   FROM sales s
   JOIN menu m USING (product_id)
   GROUP BY s.customer_id,
            m.product_name)
SELECT customer_id,
       product_name,
       purchase_count
FROM product_counts
WHERE (customer_id,
       purchase_count) IN
    (SELECT customer_id,
            max(purchase_count)
     FROM product_counts
     GROUP BY customer_id);

-- 6. Which item was purchased first by the customer after they became a member?
WITH joins AS
  (SELECT s.customer_id,
          m.join_date,
          me.product_name,
          s.order_date
   FROM sales s
   JOIN menu me USING (product_id)
   JOIN members m USING (customer_id))
SELECT customer_id,
       product_name,
       order_date
FROM joins
WHERE (customer_id,
       order_date) IN
    (SELECT customer_id,
            min(order_date)
     FROM joins
     WHERE order_date>join_date
     GROUP BY customer_Id);

-- 7. Which item was purchased just before the customer became a member?
WITH joins AS
  (SELECT s.customer_id,
          m.join_date,
          me.product_name,
          s.order_date
   FROM sales s
   JOIN menu me USING (product_id)
   JOIN members m USING (customer_id))
SELECT customer_id,
       product_name,
       order_date
FROM joins
WHERE (customer_id,
       order_date) IN
    (SELECT customer_id,
            max(order_date)
     FROM joins
     WHERE order_date < join_date group by customer_Id);

-- 8. What is the total items and amount spent for each member before they became a member?
SELECT s.customer_id,
       count(s.product_id),
       sum(m.price)
FROM sales s
JOIN menu m USING (product_id)
JOIN members AS me USING (customer_id)
WHERE s.order_date < me.join_date
GROUP BY s.customer_id;

-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points
-- would each customer have?
SELECT s.customer_id,
       sum(CASE
               WHEN m.product_name = "sushi" THEN m.price*2*10
               ELSE m.price*10
           END)
FROM sales s
JOIN menu m USING (product_id)
GROUP BY s.customer_id;


-- 10. In the first week after a customer joins the program (including their join date) they earn 2x
-- points on all items, not just sushi - how many points do customer A and B have at the end of
-- January?

SELECT s.customer_id,
       SUM(CASE
               WHEN s.order_date>=mem.join_date
                    AND s.order_date<=DATE_ADD(mem.join_date, INTERVAL 6 DAY) THEN m.price*20
               WHEN m.product_name = 'sushi' THEN m.price*20
               ELSE m.price*10
           END) AS TOTAL_POINTS
FROM sales AS s
JOIN menu AS m ON s.product_id=m.product_id
JOIN members AS mem ON mem.customer_id=s.customer_id
WHERE s.order_date<='2021-01-31'
GROUP BY s.customer_id;

