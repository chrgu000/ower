#查询821867客户3月以后的回款流水统计金额
SELECT * FROM sbs_user_repayment WHERE add_date >DATE('2019-02-28')AND user_code='830584';
SELECT SUM(money) FROM sbs_user_repayment WHERE add_date >DATE('2019-02-28')AND user_code='822149';

#查询收款单与发货单映射关系表，查询用户发货单列表
SELECT * FROM pay_gathering_statements WHERE user_code='822149' AND create_time>=UNIX_TIMESTAMP('2019-03-01 00:00:00')AND bill_type='1';
SELECT * FROM pay_gathering_statements WHERE user_code='822149' AND create_time>=UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%';



SELECT * FROM delivery_order_sub WHERE delivery_code IN(SELECT delivery_code FROM pay_gathering_statements WHERE user_code='830584' AND
 create_time>=UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%'
);

SELECT * FROM pay_gathering_statements WHERE delivery_code IN('SD201903120540','SD201902260352')
SELECT * FROM pay_gathering_statements WHERE user_code='830584' AND
 create_time>=UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%'

SELECT SUM(total_price_with_tax) FROM delivery_order_sub WHERE delivery_code IN(
'SD201903120540');

SELECT COUNT(goods_id) FROM delivery_order_sub WHERE delivery_code IN(
'SD201903130425','SD201903140523');

SELECT COUNT(g.goods_id) FROM delivery_order_sub s LEFT JOIN goods g ON g.`goods_id`=s.`goods_id` WHERE delivery_code IN(
'SD201903130425','SD201903140523')AND g.`team_id`='308001';

SELECT COUNT(g.goods_id) FROM delivery_order_sub s LEFT JOIN goods g ON g.`goods_id`=s.`goods_id` WHERE delivery_code IN(
'SD201903130425','SD201903140523')AND g.`team_id`='308002';


SELECT SUM(total_price)/(SELECT COUNT(goods_id) FROM delivery_order_sub WHERE delivery_code IN(
'SD201903130425','SD201903140523')) AS 商品分摊价格
 FROM pay_gathering_statements WHERE user_code='822149' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%';
 
 
 
 SELECT COUNT(g.goods_id)*( SELECT SUM(total_price)/(SELECT COUNT(goods_id) FROM delivery_order_sub WHERE delivery_code IN(
'SD201903130425','SD201903140523')) AS 商品分摊价格
 FROM pay_gathering_statements WHERE user_code='822149' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%')
 AS 事业部统计金额 
 FROM delivery_order_sub s LEFT JOIN goods g ON g.`goods_id`=s.`goods_id` WHERE delivery_code IN(
'SD201903130425','SD201903140523')AND g.`team_id`='308001';

 SELECT SUM(total_price)/(SELECT COUNT(goods_id) FROM delivery_order_sub WHERE delivery_code IN(
'SD201903130425','SD201903140523')) AS 商品分摊价格
 FROM pay_gathering_statements WHERE user_code='822149' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')AND close_bill_code LIKE 'RD%';

 
 
 SELECT  *,paid_price / total_price * team_price AS call_price FROM 
(
  SELECT main.delivery_code,main.department_id,goods.team_id,a.paid_price,main.total_price,sub.total_price_with_tax AS team_price  FROM 
(SELECT SUM(total_price) AS paid_price,delivery_code FROM pay_gathering_statements WHERE create_time >= UNIX_TIMESTAMP('2019-03-01') 
AND create_time <= UNIX_TIMESTAMP('2019-03-31') AND bill_type=1 AND delivery_code !='' AND user_code='822149' GROUP BY delivery_code) AS a
	LEFT JOIN delivery_order_main AS main ON main.delivery_code=a.delivery_code
	LEFT JOIN delivery_order_sub  AS sub ON sub.delivery_code=main.delivery_code
	LEFT JOIN goods ON goods.goods_id=sub.goods_id WHERE goods.`team_id`='308001' GROUP BY delivery_code
) AS a;



SELECT SUM(实际收款金额) FROM (
SELECT *,pay_total_price/total_price*total_price_with_tax AS 实际收款金额 FROM
(SELECT main.delivery_code,main.total_price,main.department_id,g.team_id,pay.pay_total_price,sub.total_price_with_tax 
 FROM (SELECT SUM(total_price)AS pay_total_price,delivery_code FROM pay_gathering_statements WHERE create_time BETWEEN UNIX_TIMESTAMP('2019-03-05 00:00:00')
 AND UNIX_TIMESTAMP('2019-03-05 23:59:59')AND bill_type='1' AND delivery_code !=''AND department_id='309012' GROUP BY delivery_code)AS pay LEFT JOIN
 delivery_order_sub AS sub
 ON pay.delivery_code=sub.delivery_code
 LEFT JOIN  delivery_order_main AS main  ON main.delivery_code=sub.delivery_code 
LEFT JOIN goods AS g ON g.goods_id=sub.goods_id WHERE g.`team_id`IN('308001') 
)AS tt)AS total


SELECT SUM(a.paid_price / main.total_price * total_price_with_tax) AS daily_total,main.department_id,g.team_id FROM 
(SELECT `delivery_code`,SUM(total_price) AS paid_price FROM pay_gathering_statements p 
WHERE create_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00') AND UNIX_TIMESTAMP('2019-03-31 23:59:59')  AND `bill_type` = 1 AND `delivery_code` <> '' GROUP BY delivery_code )
 a INNER JOIN delivery_order_main AS main ON a.delivery_code=main.delivery_code LEFT JOIN delivery_order_sub AS sub ON sub.delivery_code=a.delivery_code 
LEFT JOIN goods AS g ON g.goods_id=sub.goods_id WHERE `subject` = 100 AND team_id=308001 AND a.delivery_code IS NOT NULL AND main.department_id=309012
 #GROUP BY main.delivery_code,g.team_id;
 
 