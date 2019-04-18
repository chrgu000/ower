#查询3月以后的回款流水
SELECT * FROM sbs_user_repayment WHERE add_date >DATE('2019-02-28');
#查询821867客户3月以后的回款流水统计金额
SELECT * FROM sbs_user_repayment WHERE add_date >DATE('2019-02-28')AND user_code='821867';
SELECT SUM(money) FROM sbs_user_repayment WHERE add_date >DATE('2019-02-28')AND user_code='821867';

#查询收款单与发货单映射关系表，查询用户发货单列表
SELECT * FROM pay_gathering_statements WHERE user_code='822149' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')AND bill_type='1'

#查询出发货单价税合计金额
SELECT SUM(total_price_with_tax) FROM delivery_order_sub WHERE delivery_code IN(SELECT delivery_code FROM pay_gathering_statements WHERE user_code='821867' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')
)

SELECT * FROM delivery_order_sub WHERE sub.delivery_code IN(SELECT delivery_code FROM pay_gathering_statements WHERE user_code='821867' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')
)

#查询出vivan事业部发货单价税合计金额
SELECT SUM(sub.total_price_with_tax) FROM delivery_order_sub AS sub LEFT JOIN goods AS g ON g.goods_id=sub.goods_id WHERE sub.delivery_code IN(SELECT delivery_code FROM pay_gathering_statements WHERE user_code='821867' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')
)AND g.team_id='308001'
#查询出robot事业部发货单价税合计金额
SELECT SUM(sub.total_price_with_tax) FROM delivery_order_sub AS sub LEFT JOIN goods AS g ON g.goods_id=sub.goods_id WHERE sub.delivery_code IN(SELECT delivery_code FROM pay_gathering_statements WHERE user_code='821867' AND create_time>UNIX_TIMESTAMP('2019-03-01 00:00:00')
)AND g.team_id='308002'



SELECT p.delivery_code,p.total_price,s.total_price_with_tax FROM pay_gathering_statements AS p LEFT JOIN delivery_order_sub AS s ON s.delivery_code=p.delivery_code
WHERE FROM_UNIXTIME(p.create_time,'%Y-%m')='2019-03';

SELECT p.delivery_code,close_bill_code,p.total_price,s.total_price_with_tax FROM pay_gathering_statements AS p LEFT JOIN delivery_order_sub AS s ON s.delivery_code=p.delivery_code
WHERE p.`create_time` BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')AND UNIX_TIMESTAMP('2019-03-31 23:59:59') ORDER BY total_price

SELECT * FROM delivery_order_main WHERE delivery_code='SD201903120562'
#查询对冲发货单
SELECT p.`delivery_code`,p.`total_price`,s.`total_price_with_tax`  FROM pay_gathering_statements AS p LEFT JOIN delivery_order_sub AS s 
ON p.`delivery_code`=s.`delivery_code`
WHERE p.`create_time` BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')AND UNIX_TIMESTAMP('2019-03-31 23:59:59')
AND p.bill_type='2' ;



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


