SELECT star_date,salesman_code,user_code,star_level,medal_level,profession_id,department_id FROM user_star_log u LEFT JOIN profession p ON
u.`profession_id`=p.id 
WHERE star_date='2019-01'
AND u.`user_code`='803132'
 ORDER BY star_level DESC

#计算客户某个时间段下单，并且子订单不包含cancelled

SELECT SUM(order_total_price)FROM(
SELECT s.order_code,FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='803644' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-12-22 00:00:00')AND UNIX_TIMESTAMP('2019-03-22 23:59:59')
 GROUP BY m.`order_code`
# and s.order_state NOT IN ('cancelled','close')
) AS price


SELECT user_code,SUM(total_price_with_tax) total_price FROM delivery_order_main m LEFT JOIN delivery_order_sub s
ON m.delivery_code=s.delivery_code
WHERE m.order_type='delivery'
AND order_code IN(SELECT order_code FROM orderinfo_main WHERE user_code='803644'
AND gen_time BETWEEN UNIX_TIMESTAMP('2018-10-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59'));

SELECT star_date,salesman_code,user_code,star_level,medal_level,profession_id,department_id FROM user_star_log u LEFT JOIN profession p ON
u.`profession_id`=p.id 
WHERE star_date='2019-01'
AND u.`user_code`='803644'
 ORDER BY star_level DESC
 #查询上个季度发货单金额
 
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
		SUBSTRING(dr.order_code, 3, 6) >=201807
		AND SUBSTRING(dr.order_code, 3, 6) <= 201809
	)
AND ma.order_type = 'delivery' AND dr.user_code=809889 AND dr.user_code NOT IN('804894','812240','825623','814799','832890',
'828347','805026','811485','811481','829379','828310','800017','813557','803668','821315','811713','822908','821628','810331'
,'826476','815522','821859','828020','826475','823868','829473','827881','823685','829722','803132','800469','800005','804196'
,'804936','804392','803095','800991','806379','821813','811273','826015','826087','809889','808459','805224','820915','816411',
'804726','828474','830164','821337','817812','816050','819575','813004','813760','828052','828845','828837','828846','828840',
'828841','828850','828848','828851','828852','828853','828847','828849','828838','828094','803892','811215','806860','829247',
'822433','808841','811927','803644','809966','813321','809718','828202','830919')AND de.order_code IN('SO2018070400430'
,'SO2018070400429'
,'SO2018070600232'
,'SO2018070900051'
,'SO2018071200094'
,'SO2018071300599'
,'SO2018071800418'
,'SO2018071900339'
,'SO2018071900338'
,'SO2018072100251'
,'SO2018072300123'
,'SO2018072800396'
,'SO2018073100269'
,'SO2018073100271'
,'SO2018080200140'
,'SO2018080200505'
,'SO2018080600047'
,'SO2018080600604'
,'SO2018080600591'
,'SO2018080700262'
,'SO2018081600164'
,'SO2018081800243'
,'SO2018082100298'
,'SO2018082100276'
,'SO2018082300036'
,'SO2018082700654'
,'SO2018090300545'
,'SO2018091000067'
,'SO2018091400048'
,'SO2018091800061'
,'SO2018091800062'
,'SO2018092200086'
,'SO2018092600140'
,'SO2018092900154')
GROUP BY
	dr.order_code
	
	809
	#代理商客户
	
	SELECT order_total_price,user_code,order_code FROM orderinfo_main WHERE order_code IN
	(SELECT SUBSTRING(remark,-15) FROM orderinfo_main WHERE remark LIKE'%AG%'
	AND
	(
		SUBSTRING(order_code,3,6) >=201810
		AND SUBSTRING(order_code,3,6) <= 201812
	)

