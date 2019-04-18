SELECT DISTINCT
	user_code,
	order_code,
	FROM_UNIXTIME(gen_time)
FROM
	orderinfo_main
WHERE
	gen_time BETWEEN UNIX_TIMESTAMP('2018-11-01 00:00:00')
AND UNIX_TIMESTAMP('2019-01-01 09:40:00')
AND department_id = 309023

SELECT * FROM orderinfo_main WHERE order_code LIKE '%SO20181229%' AND department_id=309023
SELECT * FROM delivery_order_main WHERE delivery_code LIKE'%SD20181229%'AND department_id=309023

SELECT user_code,
	order_code,
	order_total_price,
	order_total_quantity,
	FROM_UNIXTIME(gen_time) FROM orderinfo_main WHERE user_code IN(
SELECT user_code FROM USER WHERE user_code NOT IN (SELECT 
	user_code
FROM
	orderinfo_main
WHERE
	gen_time BETWEEN UNIX_TIMESTAMP('2018-11-10 00:00:00')
AND UNIX_TIMESTAMP('2019-01-01 09:40:00')
)AND department_id = 309023)AND gen_time<UNIX_TIMESTAMP('2018-11-10 00:00:00')
ORDER BY order_code DESC