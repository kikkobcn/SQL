select c.COUNTRY, c.CUSTOMER_ID, c.COMPANY_NAME, sum( UNIT_PRICE * QUANTITY * (1- DISCOUNT))
From CUSTOMERS c  
INNER JOIN ORDERS o  INNER JOIN ORDER_DETAILS d 
on o.ORDER_ID = d.ORDER_ID on c.CUSTOMER_ID = o.CUSTOMER_ID
group by c.COUNTRY,c.CUSTOMER_ID
order by c.COUNTRY,c.CUSTOMER_ID;

