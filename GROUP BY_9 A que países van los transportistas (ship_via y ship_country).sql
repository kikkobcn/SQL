select ship_country,num_envios 
from (select ship_country, count(*) num_envios from ORDERS group by ship_country ) num
order by ship_country;


