 SELECT department_name,shop_user_code,FROM_UNIXTIME(begin_time),FROM_UNIXTIME(end_time),num FROM cabinet
  WHERE department_name LIKE '%bali%'

SELECT s.user_id FROM sbs_department_user d LEFT JOIN sbs_tag_user s ON d.user_id=s.user_id WHERE d.department_id='34' AND d.state='0'
AND s.tag_id='3' AND s.state='0'


 SELECT m.order_code,FROM_UNIXTIME(gen_time),m.user_code,
 SUM(total_price),s.`order_state`,goods_id,team_id,price,team_name
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='818112' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59')
 AND s.team_id NOT IN('308005','308006')
 AND s.order_state NOT IN ('cancelled','closed')