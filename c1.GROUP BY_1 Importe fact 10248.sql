select ORDER_ID, 
sum( UNIT_PRICE * QUANTITY - UNIT_PRICE * QUANTITY * DISCOUNT) importe
From ORDER_DETAILS where ORDER_ID = 10248
group by ORDER_ID;