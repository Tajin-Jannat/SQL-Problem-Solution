

use [Practices];

CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INT
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3')
  --('C', '2021-01-01', '3'),
  --('C', '2021-01-01', '3'),
  --('C', '2021-01-07', '3');
-------------------------------------------
CREATE TABLE menu (
  product_id INTEGER NOT NULL,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'Rice', '10'),
  ('2', 'curry', '15'),
  ('3', 'Sweet', '12');z


CREATE TABLE members (
  customer_id VARCHAR(1) not null,
  join_date DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),

  ('B', '2021-01-09');


---Solved the following questions:
select * from sales; 
select * from members;
select * from menu;

--1)--What is the total amount each customer spent at the restaurant?

select customer_id, sum(price) as total_spent
from sales join menu on sales.product_id=menu.product_id 
group by customer_id;

2)--How many days has each customer visited the restaurant?
select customer_id, count(order_date) as DayOfVisit
from sales
group by customer_id;

3)--What was the first item from the menu purchased by each customer?
select sales.customer_id, product_name as first_item 
from sales 
join members on members.customer_id=sales.customer_id 
join menu on sales.product_id=menu.product_id
where sales.order_date=members.join_date 

4)--What is the most purchased item on the menu and how many times was
--it purchased by all customers?
5) --Which item was the most popular for each customer?

6)--Which item was purchased first by the customer after they became 
--a member?

7)--Which item was purchased just before the customer became a member?

8)--What is the total items and amount spent for each member before
---they became a member?