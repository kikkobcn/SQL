select Orders.order_id,Orders.order_date,Orders.product_id from Orders
INNER JOIN Products ON Orders.product_id = Products.product_id
where Orders.order_id = 10248