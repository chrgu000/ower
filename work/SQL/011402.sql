#查询上月发货单金额用以计算本月客户星级
SELECT
	DISTINCT (os.order_code),SUM(ds.total_price_with_tax),FROM_UNIXTIME(om.`gen_time`),dm.order_type,om.`user_code`,om.`customer_name`,om.`shop_name`,om.`department_id`,om.`department_name`,
	om.`salesman_code`,om.`salesman_name`
	FROM 
	orderinfo_main AS om LEFT JOIN delivery_order_main AS dm ON om.`user_code`=dm.`user_code` #订单主表关联发货单主表
			     LEFT JOIN orderinfo_sub AS os ON om.`order_code`=os.`order_code` #订单主表关联订单子表
			     LEFT JOIN delivery_order_sub AS ds ON dm.`delivery_code`=ds.`delivery_code` #发货单主表关联发货单子表
	WHERE om.gen_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00') AND UNIX_TIMESTAMP('2018-12-31 59:59:59') AND om.user_code='810110'
	AND dm.order_type='delivery';
#查询本月订单金额及数量
SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id,s.price
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='805720' AND m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-13 16:00:00')
GROUP BY m.order_total_quantity 
#查询上月发货单金额用以计算本月客户星级
SELECT
	DISTINCT(order_code),user_code,
	SUM(total_price_with_tax) AS total_price,s.delivery_code
FROM
	delivery_order_sub AS s
LEFT JOIN delivery_order_main AS m ON s.delivery_code = m.delivery_code
WHERE
	m.order_type = 'delivery'
	AND
	 m.create_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59')
	AND user_code='803022'
	#group by s.delivery_code
#查询客户星级	
SELECT DISTINCT(user_code),star_level,medal_level FROM user_star_log WHERE star_date IN ('2019-01')
 AND star_level='5'
 #and user_code='806739'
 #查询客户近半年星级用来计算奖牌	
 SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('2018-12')
  #GROUP BY user_code 
 #HAVING COUNT(star_level)>2
 AND user_code='800005'
# 查询某个等级奖牌人数总和
 
SELECT COUNT(DISTINCT(user_code)),star_level,medal_level,star_date FROM user_star_log WHERE star_date =('2019-01')
 #AND user_code='803022'
 AND medal_level='5'
 ORDER BY user_code ASC
 
 SELECT  DISTINCT(user_code),star_level,medal_level,star_date FROM user_star_log WHERE star_date =('2019-01') AND medal_level='5'

	
SELECT user_code,m.order_code,FROM_UNIXTIME(gen_time) '下单时间',department_id,salesman_code,agent_id,order_total_price,order_total_quantity,s.order_state 
	FROM orderinfo_main  m LEFT JOIN orderinfo_sub s ON m.order_code = s.order_code
	WHERE FROM_UNIXTIME(gen_time,'%Y-%m') = '2018-11'  AND department_id = '309012' AND user_code = '814799';


7