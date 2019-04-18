SELECT DISTINCT(m.user_code),m.order_code,m.remark FROM orderinfo_sub s LEFT JOIN orderinfo_main m ON s.`order_code`=m.`order_code`
 WHERE s.order_state LIKE'%delivered(part)%' AND SUBSTRING(m.order_code, 3, 6) >=201810 AND SUBSTRING(m.order_code, 3, 6) <= 201812
 AND m.remark IS NOT NULL 

SELECT order_code,user_code,order_total_price FROM orderinfo_main WHERE order_code IN('AG2018112200026','AG2018121900010')
#查询用用在此时间段内的订单
SELECT order_code FROM orderinfo_main WHERE  user_code='826543' AND SUBSTRING(order_code,3,6) >=201810
		AND SUBSTRING(order_code,3,6) <= 201812
#查询订单转单后代理商订单

 SELECT order_code,user_code,order_total_quantity,order_total_price,remark FROM orderinfo_main WHERE SUBSTRING(remark,-15) = ('AG2018101100074');
 SELECT order_code,user_code,order_total_quantity,order_total_price,remark FROM orderinfo_main WHERE SUBSTRING(remark,-15) = ('AG2018112200026');
 SELECT order_code,user_code,order_total_quantity,order_total_price,remark FROM orderinfo_main WHERE SUBSTRING(remark,-15) = ('AG2018121900010');
 #查询对应订单的发货单及发货数量
 SELECT order_code,delivery_code,SUM(total_price_with_tax) total_price,SUM(quantity) total_quantity,goods_id FROM delivery_order_sub 
WHERE order_code IN('SO2018101100874','SO2018112200341','SO2018121900393') GROUP BY order_code,goods_id  ORDER BY order_code DESC;
#查询部分发货订单的商品ID及单价
  SELECT main.order_code,user_code,order_total_quantity,goods_id,order_total_price,num,price FROM orderinfo_main AS main LEFT JOIN orderinfo_sub AS sub ON main.order_code=sub.`order_code`
  WHERE main.order_code='AG2018101100074';
  #查询客户星级信息
  SELECT *FROM user_star_log
WHERE star_date='201810'
AND `user_code`='826543';
  
SELECT * FROM USER WHERE user_code='826543'


