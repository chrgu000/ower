SELECT department_name,shop_user,shop_user_code,num,FROM_UNIXTIME(begin_time)FROM cabinet WHERE department_name LIKE '%pa%'

SELECT SUM(order_total_price),SUM(order_total_quantity) FROM (SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='823962' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-05-01 00:00:00')AND UNIX_TIMESTAMP('2018-05-31 23:59:59')
GROUP BY m.order_code
 HAVING s.order_state NOT IN ('cancelled','closed')) AS orderinfo;
 
 #展柜数据查询
 SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,
 SUM(total_price),s.`order_state`,goods_id,team_id,price,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='816775' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-06-01 00:00:00')AND UNIX_TIMESTAMP('2018-06-30 23:59:59')
 AND s.team_id NOT IN('308005','308006')
 AND s.order_state NOT IN ('cancelled','closed')



 
 SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,
 m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id,team_id,price,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='816775' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-07-01 00:00:00')AND UNIX_TIMESTAMP('2018-07-31 23:59:59')
 #and s.team_id not in('308005','308006')
GROUP BY s.order_code
HAVING 
 s.order_state NOT IN ('cancelled','closed');
 
 SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,
 s.price,s.num,s.`order_state`,goods_id,team_id,price,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='816775' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-07-01 00:00:00')AND UNIX_TIMESTAMP('2018-07-31 23:59:59')
 #AND s.team_id NOT IN('308005','308006')
GROUP BY s.order_code
HAVING 
 s.order_state NOT IN ('cancelled','closed');
 
SELECT SUM(total_price) FROM(SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,total_price,
 m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id,team_id,price,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='816775' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-07-01 00:00:00')AND UNIX_TIMESTAMP('2018-07-31 23:59:59')AND s.team_id NOT IN('308005','308006'))AS ss;

 
 
 
 
 
 SELECT * FROM orderinfo_sub WHERE team_id IN('308005','308006')
 
 SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id,team_id,m.department_id,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE 
m.department_id='309019' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-07-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-31 23:59:59')AND team_id  IN('308005','308006')
 
 SELECT department_name,shop_user_code,FROM_UNIXTIME(begin_time),FROM_UNIXTIME(end_time),num FROM cabinet WHERE department_name LIKE '%Manado%' AND shop_user_code='816775'
 
 
SELECT SUM(total_price) FROM (SELECT * FROM orderinfo_sub WHERE order_code IN ('SO2018070100175','SO2018070200172','SO2018070400025','SO2018070500327',
'SO2018070900612','SO2018071400154','SO2018071800275','SO2018072900148')
 AND order_state NOT IN ('cancelled','closed')
 AND team_id NOT IN('308005','308006')
 )AS v
 
 