select extract(YEAR from o.ORDER_DATE) "Year",
c.country,
sum( od.UNIT_PRICE * od.QUANTITY * (1- od.DISCOUNT))
From Orders o, Order_Details od, Customers c
where o.ORDER_ID = od.ORDER_ID and c.customer_id = o.customer_id
group by c.country,extract(YEAR from o.ORDER_DATE)
order by c.country,extract(YEAR from o.ORDER_DATE); 