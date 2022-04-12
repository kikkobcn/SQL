select extract(YEAR from o.ORDER_DATE),
p.product_id,p.product_name,sum( od.UNIT_PRICE * od.QUANTITY * (1- od.DISCOUNT))
From Orders o, Order_Details od, Products p
where o.ORDER_ID = od.ORDER_ID and od.product_id = p.product_id
group by p.product_id, p.product_name, extract
order by extract, p,product_name