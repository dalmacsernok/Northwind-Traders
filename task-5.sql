SELECT EXTRACT(year from orders.order_date) AS year, EXTRACT(month FROM orders.order_date) AS month,
COUNT(order_details.order_id),
ROUND(SUM((order_details.unit_price * quantity)-(order_details.unit_price * quantity * discount))) AS sum
FROM orders, order_details
WHERE EXTRACT(year FROM orders.order_date) = 1997
AND order_details.order_id = orders.order_id
GROUP BY EXTRACT (year FROM orders.order_date), EXTRACT(month FROM orders.order_date);