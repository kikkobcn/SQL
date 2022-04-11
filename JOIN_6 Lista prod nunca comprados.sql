SELECT * FROM Products p 
WHERE NOT EXISTS 
(SELECT * FROM Order_Details od WHERE  p.product_id = od.product_id)