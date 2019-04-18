SELECT
 SUM(total_price)
FROM
 pay_gathering_statements
WHERE
 delivery_code IN (
  SELECT
   main.delivery_code
  FROM
   delivery_order_sub AS sub
  LEFT JOIN goods g ON g.`goods_id` = sub.`goods_id`
  LEFT JOIN delivery_order_main AS main ON main.`delivery_code`=sub.`delivery_code`
  WHERE g.team_id = '308001' AND main.subject = 100
 )AND department_id = '309012'
				AND create_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')
				AND UNIX_TIMESTAMP('2019-03-20 23:59:59')
				AND bill_type = '1'
				AND close_bill_code LIKE 'RD%';



SELECT SUM(total_price) FROM pay_gathering_statements
WHERE department_id='309012' AND create_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00') AND 
UNIX_TIMESTAMP('2019-03-20 23:59:59') AND bill_type='1'AND close_bill_code LIKE 'RD%'

SELECT SUM(s.total_price),s.goods_id, g.team_id FROM(
	SELECT p.total_price,d.goods_id
	FROM pay_gathering_statements p LEFT JOIN delivery_order_sub d ON p.delivery_code=d.delivery_code
	WHERE department_id = '309012'
	AND create_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')
	AND UNIX_TIMESTAMP('2019-03-20 23:59:59')
	AND bill_type = '1'
	AND close_bill_code LIKE 'RD%')
AS s LEFT JOIN goods g ON s.goods_id=g.goods_id WHERE g.team_id='308001';


SELECT SUM(ps.total_price),g.team_id FROM
(SELECT pay.total_price,sub.goods_id,sub.`quantity` FROM pay_gathering_statements AS pay LEFT JOIN delivery_order_sub AS sub ON pay.`delivery_code`=sub.`delivery_code`
 WHERE pay.department_id = '309012'
	AND pay.create_time BETWEEN UNIX_TIMESTAMP('2019-03-20 00:00:00') AND UNIX_TIMESTAMP('2019-03-20 23:59:59')
	AND pay.bill_type = '1'
	AND pay.close_bill_code LIKE 'RD%')AS ps LEFT JOIN goods AS g ON g.`goods_id`=ps.goods_id WHERE g.`team_id`='308002';
	
	
SELECT main.department_id,g.team_id FROM 
(( SELECT `delivery_code`,SUM(total_price) AS paid_price FROM pay_gathering_statements p WHERE
 ( `create_time` >= 1551373200 AND `create_time` < 1553878800 ) 
 AND `bill_type` = 1 AND `delivery_code` <> '' GROUP BY delivery_code )) a 
 LEFT JOIN delivery_order_main AS main ON a.delivery_code=main.delivery_code 
  LEFT JOIN delivery_order_sub AS sub ON sub.delivery_code=a.delivery_code LEFT JOIN 
  goods AS g ON g.goods_id=sub.goods_id WHERE `subject` = 100 GROUP BY main.department_id,g.team_id


