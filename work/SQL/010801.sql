SELECT user_code,customer_last_level,customer_level,customer_last_stars,customer_stars,FROM_UNIXTIME(register_time),update_stars_time FROM `user` WHERE user_code  =823662;

SELECT  order_code FROM orderinfo_main WHERE user_code =823662 AND gen_time >1538203691;

SELECT
	user_code,
	SUM(total_price_with_tax) AS total_price
FROM
	delivery_order_sub AS s
LEFT JOIN delivery_order_main AS m ON s.delivery_code = m.delivery_code
WHERE
	m.order_type = 'delivery'
AND order_code IN (SELECT  order_code FROM orderinfo_main WHERE user_code =803892 AND gen_time >1538203691)
GROUP BY
	user_code DESC
	
	
SELECT user_code,gen_time,s.order_code FROM  orderinfo_sub AS s LEFT JOIN orderinfo_main AS m ON m.order_code = s.order_code 
            WHERE gen_time >= {$sixtyDays} AND order_state IN 
('booking', 'generate', 'delivered', 'delivered(part)', 'received', 'billing', 'finished', 'finished(part)', 'returned', 'agent_purchased', 'agent_generated', 'agent_delivered', 'agent_booking', 'agent_accepted') 
AND gen_time <=" . $startingTime . " GROUP BY FROM_UNIXTIME(gen_time,'%Y-%m-%d'), user_code	



SELECT user_code,SUM(total_price_with_tax) AS total_price FROM delivery_order_sub AS s LEFT JOIN 
delivery_order_main AS m ON s.delivery_code = m.delivery_code WHERE m.order_type = 'delivery' AND 
order_code IN ($orderCodeArrStr) GROUP BY user_code DESC