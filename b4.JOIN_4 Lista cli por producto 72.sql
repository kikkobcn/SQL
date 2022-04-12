select od.product_id, p.product_name, o.order_id, c.customer_id, c.company_name
from Order_details od
inner join Products p
on od.product_id = p.product_id
inner join Orders o
on o.order_id = od.order_id
inner join Customers c
on o.customer_id = c.customer_id
where od.product_id = 72
