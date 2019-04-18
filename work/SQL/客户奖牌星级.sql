SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('2018-12') and star_level>'0' 
 GROUP BY user_code 
having COUNT(star_level)=3 
 #AND user_code='803339'

 SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('2018-12') #AND user_code='806180'
  HAVING COUNT(star_level)>5
  #GROUP BY user_code 
 #HAVING COUNT(star_level)>2           #805720客户cancelled状态价格计算
#计算客户本月下单，并且子订单不包含cancelled
SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,sum(m.order_total_price),sum(m.order_total_quantity),s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='805720' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-13 16:00:00')
GROUP BY m.order_code
 HAVING s.order_state not in ('cancelled')
ORDER BY m.user_code ASC

#计算客户本月下单，并且子订单不包含cancelled
SELECT SUM(order_total_price),sum(order_total_quantity) FROM (SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='805720' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-13 16:00:00')
GROUP BY m.order_code
 HAVING s.order_state not in ('cancelled')) as orderinfo










GROUP BY m.user_code

SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date =('2019-01')  and user_code in ('800005','800469','803022','803095',
'805000','805085','805097','805205','805375','805560','805720','806379','805560')#800005 #803095,800469

 SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('2019-01')
  #GROUP BY user_code 
 #HAVING COUNT(star_level)>2
 AND user_code='805720'



SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='805720' AND m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-13 23:59:59')
#and s.order_state in ('cancelled')
GROUP BY m.order_total_quantity ,m.order_total_price,s.order_state
HAVING s.order_state not in ('cancelled')


SELECT DISTINCT(user_code),star_level,medal_level FROM user_star_log WHERE star_date IN ('2019-01')
 #AND star_level='2'
 and user_code='805720'