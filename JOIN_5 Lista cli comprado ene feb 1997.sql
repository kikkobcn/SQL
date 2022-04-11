select o.order_id,o.order_date, o.customer_id, c.company_name
from Orders o
inner join Customers c
on o.customer_id = c.customer_id
where o.order_date > '1997-01-01' AND o.order_date < '1997-02-28'
order by c.company_name