
--Listado de pedidos del producto 8
select * from orders o, order_details od
where o.order_id = od.order_id and product_id = 8;
------------------------------------------------------------------------------ 

--Listado de facturas en las que no se vendió el producto 8 por fecha fact
select DISTINCT order_date from orders o, order_details od
where o.order_id = od.order_id and product_id = 8
order by order_date;
-------------------------------------------------------------------------------

--Listado de pedidos por clientes
select * from customers c, orders o, order_details od
where c.customer_id = o.customer_id and o.order_id = od.order_id;
-------------------------------------------------------------------------------

--Listado de productos no vendidos
select products.* from Products
inner join Order_details od on Products.product_id = od.Product_id
where od.product_id is null;
-------------------------------------------------------------------------------

--Listado de las ciudades por pais y ciudad
select country, city, count(*) from customers
group by country, city
order by country, city;
-------------------------------------------------------------------------------

--Listado de las facturas emitidas en 1997 por Company_name  
select company_name, count(*) FROM customers c, orders o
where c.customer_id = o.customer_id
and extract(year from order_date) = 1997
group by company_name
ORDER BY company_name;
-------------------------------------------------------------------------------

--Listado de las facturas emitidas por año
select extract(year from order_date) as anio, count(*)
from orders
group by extract(year from order_date);
-------------------------------------------------------------------------------

--Listado importes de las facturas emitidas al cliente BLONP en 1997
select od.order_id, sum(unit_price * quantity) as total from order_details od
inner join orders o on od.order_id = o.order_id
where o.customer_id = 'BLONP'and  o.order_date >= '1997-01-01'
and o.order_date <= '1997-12-31'GROUP BY od.order_id; order by total desc, od.order_id;
-------------------------------------------------------------------------------

--Facturado general por cliente en orden de cliente (columna 1) 
select company_name,sum(unit_price * quantity * (1 - discount)) as total
from customers c 
inner join orders o inner join order_details od
on od.order_id = o.order_id
on c.customer_id = o.customer_id
GROUP BY company_name
order by 1;
-------------------------------------------------------------------------------

--Facturado por cliente del año 1997 en orden de cliente (columna 1) 
select company_name,sum(unit_price * quantity * (1 - discount)) as total
from customers c, orders o, order_details od
where c.customer_id = o.customer_id and o.order_id = od.order_id and
extract(year from order_date) = 1997
GROUP BY company_name
order by 1;
-------------------------------------------------------------------------------

--Listado clientes con mas de 10 facturas en orden de num facturas
select company_name, count(*) from customers 
inner join orders o on customers.customer_id = o.customer_id
GROUP BY company_name
HAVING count(*) > 10
order by 2;
-------------------------------------------------------------------------------

--Lista clientes que caompraron el producto 11
select c.* from customers c, orders o, order_details od
where c.customer_id = o.customer_id and o.order_id = od.order_id AND
od.product_id = 11
-------------------------------------------------------------------------------

--Lista productos mas vendidos por año, por producto en orden de año y cantidad descendente
select  extract(year from order_date) aaaa, product_name, sum(quantity)
from orders o , order_details od, products p
where o.order_id = od.order_id and od.product_id = p.product_id
group by extract(year from order_date), product_name
order by 1 , 3 desc, 2; 
-------------------------------------------------------------------------------

--Lista clientes con mas de 10 facturas en orden de num facturas descendente
select company_name, count(*) from customers c,orders o
where c.customer_id = o.customer_id
group by company_name
having count(*) > 10
order by 2 desc;
-------------------------------------------------------------------------------

--Creación de una tabla con los datos de las facturas emitidas por año
--y por cliente en orden de año descendentes y cliente
insert into  borrame as
select  extract(year from order_date), company_name, 
sum(quantity * unit_price * (1 - discount)) as total
from customers c, orders o, order_details od
where c.customer_id = o.customer_id and o.order_id = od.order_id
group by  extract(year from order_date), company_name
order by 1, 3 desc;
-------------------------------------------------------------------------------

--listado de la tabla borrame
select * from borrame;

