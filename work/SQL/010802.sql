SELECT DISTINCT(order_state) FROM orderinfo_sub;
SELECT volume,weight FROM goods WHERE goods_id=100007


SELECT goods_id,reseller_price

SELECT reseller_price FROM goods GROUP BY reseller_price HAVING COUNT(reseller_price)>1;
SELECT g.goods_id,g.reseller_price,gs.warehouse_id,gs.app_available_num,g.`goods_name` 
		FROM goods AS g LEFT JOIN goods_stock AS gs ON g.goods_id=gs.goods_id
		WHERE g.reseller_price=20000 AND gs.`warehouse_id`='101';

SELECT 
  * 
FROM
  orderinfo_main 
WHERE gen_time > UNIX_TIMESTAMP('2018-12-20 23:59:59') 822773 
  SELECT 
    * 
  FROM
    sbs_problem_process_log 
  WHERE solver = 'pengzhipeng' 
    SELECT 
      FROM_UNIXTIME(send_time),
      user_id,
      send_state 
    FROM
      message_send_log 
    WHERE user_id = 'pengzhipeng' 
      AND send_time > UNIX_TIMESTAMP('2019-01-04 00:00:00') 
      SELECT DISTINCT 
        (salesman_code),
        department_id,
        user_code 
      FROM
        USER 
      WHERE department_id = 309023 
