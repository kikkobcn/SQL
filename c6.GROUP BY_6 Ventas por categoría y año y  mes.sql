select extract(YEAR from o.ORDER_DATE) "Year", 
extract(MONTH from o.ORDER_DATE) "Month",
ca.category_name,
sum( od.UNIT_PRICE * od.QUANTITY * (1- od.DISCOUNT))
From Orders o, Order_Details od, Products p, Categories ca
where o.ORDER_ID = od.ORDER_ID and od.product_id = p.product_id and p.category_id = ca.category_id
group by extract(YEAR from o.ORDER_DATE),extract(MONTH from o.ORDER_DATE),ca.category_name
order by extract(YEAR from o.ORDER_DATE), extract(MONTH from o.ORDER_DATE),ca.category_name;                             