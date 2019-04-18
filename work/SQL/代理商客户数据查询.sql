#查询代理商客户并且星级不为0
SELECT u.star_date,u.salesman_code,us.user_code,u.star_level,u.remark FROM user_star_log u
LEFT JOIN `user` us ON us.`user_code`=u.`user_code`
WHERE u.star_date='201810' AND u.`star_level`>0
AND us.customer_manage_type='AgentCustomer';
#计算客户星级
SELECT * FROM user_star_log
WHERE 
star_date ='201810'
AND `user_code`='821356';
#查询客户上级代理
SELECT agent_id FROM 'user' WHERE user_code='821356';
#查询客户的订单
SELECT order_code FROM orderinfo_main WHERE  user_code='821356' AND SUBSTRING(order_code,3,6) >=201810
		AND SUBSTRING(order_code,3,6) <= 201812  AND order_code LIKE 'AG%';
 SELECT * FROM orderinfo_main WHERE SUBSTRING(remark,-15) = ('AG2018120700043');

#根据订单号查询发货单金额
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
AND ma.order_type = 'delivery'  AND de.order_code IN('SO2018110100308');

SELECT order_total_price FROM orderinfo_main WHERE order_code='AG2018120700043'



