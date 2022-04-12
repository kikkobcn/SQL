select company_name, num_fact, acum
from(select customer_id, count(*)num_fact from Orders group by customer_id) acum
inner join Customers cu on acum.customer_id =cu.customer_id
where acum.num_fact >3
order by num_fact;