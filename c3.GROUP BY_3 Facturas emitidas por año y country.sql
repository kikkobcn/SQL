select extract(YEAR from o.ORDER_DATE), c.COUNTRY, sum( UNIT_PRICE * QUANTITY * (1- DISCOUNT))
From CUSTOMERS c  
INNER JOIN ORDERS o  INNER JOIN ORDER_DETAILS d 
on o.ORDER_ID = d.ORDER_ID on c.CUSTOMER_ID = o.CUSTOMER_ID
group by extract, c.COUNTRY
order by extract, c.COUNTRY;
