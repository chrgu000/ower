 
 SELECT
	ma.user_code,
	SUM(total_price_with_tax) AS total_price,
	dr.order_code,
	dr.remark,
	order_sub_id
FROM
	delivery_order_sub AS de
LEFT JOIN delivery_order_main AS ma ON ma.delivery_code = de.delivery_code
LEFT JOIN orderinfo_main AS dr ON de.order_code = dr.order_code
WHERE
	(
		SUBSTRING(dr.order_code, 3, 6) >=201810
		AND SUBSTRING(dr.order_code, 3, 6) <= 201812
	)
AND ma.order_type = 'delivery' AND dr.user_code=803644
GROUP BY
	dr.order_code
	
	
SELECT DISTINCT(order_code),SUM(order_total_price),SUM(order_total_quantity)FROM (	
SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='803644' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-12-22 00:00:00')AND UNIX_TIMESTAMP('2019-03-22 23:59:59')
 GROUP BY order_code
 #AND s.order_state NOT IN ('cancelled','close')
)AS price


SELECT * FROM USER WHERE customer_manage_type='WookAgent' AND customer_last_stars='5'

SELECT * FROM orderinfo_main WHERE order_code LIKE'%AG%'AND gen_time BETWEEN UNIX_TIMESTAMP('2018-10-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59')

SELECT * FROM USER WHERE agent_id = '807290'

SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id,s.order_sub_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.order_code LIKE'%AG%'  AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-10-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59')
 AND s.order_state NOT IN ('cancelled','close')



 SELECT
	ma.user_code,
	SUM(total_price_with_tax) AS total_price,
	dr.order_code,
	dr.remark,
	order_sub_id
FROM
	delivery_order_sub AS de
LEFT JOIN delivery_order_main AS ma ON ma.delivery_code = de.delivery_code
LEFT JOIN orderinfo_main AS dr ON de.order_code = dr.order_code
WHERE
	(
		SUBSTRING(dr.order_code, 3, 6) >=201810
		AND SUBSTRING(dr.order_code, 3, 6) <= 201812
	)
AND ma.order_type = 'delivery' AND dr.user_code=806652;


SELECT user_code,star_date,salesman_code,star_level,medal_level,profession_id FROM user_star_log
WHERE star_date='2019-01'
AND `user_code`='806652'


 ORDER BY star_level DESC
