SELECT FROM_UNIXTIME(gen_time),user_code,department_id FROM orderinfo_main WHERE order_code='SO2019010800003'

	SELECT
	DISTINCT (os.order_code),SUM(ds.total_price_with_tax),FROM_UNIXTIME(om.`gen_time`),dm.order_type,om.`user_code`,om.`customer_name`,om.`shop_name`,om.`department_id`,om.`department_name`,
	om.`salesman_code`,om.`salesman_name`
	FROM 
	orderinfo_main AS om LEFT JOIN delivery_order_main AS dm ON om.`user_code`=dm.`user_code` #订单主表关联发货单主表
			     LEFT JOIN orderinfo_sub AS os ON om.`order_code`=os.`order_code` #订单主表关联订单子表
			     LEFT JOIN delivery_order_sub AS ds ON dm.`delivery_code`=ds.`delivery_code` #发货单主表关联发货单子表
	WHERE om.gen_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00') AND UNIX_TIMESTAMP('2018-12-31 59:59:59') AND om.user_code='821618'
	AND dm.order_type='delivery';
	
	
SELECT 
  order_code 
FROM
  orderinfo_main om 
  LEFT JOIN orderinfo_sub os 
    ON om.`order_code` = os.`order_code` 
WHERE om.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00') 
  AND UNIX_TIMESTAMP('2019-01-10 14:00:00') 
  AND user_code = 831204  
SELECT
	user_code,
	SUM(total_price_with_tax) AS total_price
FROM
	delivery_order_sub AS s
LEFT JOIN delivery_order_main AS m ON s.delivery_code = m.delivery_code
WHERE
	m.order_type = 'delivery'
AND order_code in(SELECT order_code FROM orderinfo_main WHERE gen_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 14:00:00')
 AND user_code =831204
)
GROUP BY
	user_code DESC	
	
	
	