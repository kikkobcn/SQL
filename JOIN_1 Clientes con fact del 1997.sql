select Orders.order_id,Orders.order_date,Orders.customer_id from Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id
where Orders.order_date > '1997-01-01' AND Orders.order_date < '1997-03-12'
order by Orders.customer_id