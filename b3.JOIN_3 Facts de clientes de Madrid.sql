select Orders.order_id, Orders.order_date, Orders.customer_id, Customers.city from Orders
inner JOIN Customers on Orders.customer_id = Customers.customer_id
where Customers.city = 'Madrid';