select ship_name, num_envios
from (select ship_name, count(*) num_envios from orders group by ship_name) num
order by num_envios;


