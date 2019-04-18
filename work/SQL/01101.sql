SELECT * FROM sbs_problem_process_log WHERE solver='geovanianggasta' AND process_type='solved'
SELECT id,COUNT(task_id),operator_id,contact_result,FROM_UNIXTIME(contact_time) FROM sbs_task_track_history WHERE contact_time>1544025600
AND contact_time<1544111999 
AND operator_id='geovanianggasta'
AND
  SELECT goods_id,weight,max_limit_num,max_limit_num_of_day,default_num,volume,reseller_price,market_price FROM goods WHERE goods_id='100403'
  SELECT user_code FROM USER WHERE agreement_id='null'
  
SELECT DISTINCT (m.order_code),FROM_UNIXTIME(gen_time),m.user_code,s.order_state,m.department_id FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.order_code 
WHERE gen_time BETWEEN UNIX_TIMESTAMP('2019-01-02 00:00:00')AND UNIX_TIMESTAMP('2019-01-07 23:59:59')
 AND s.order_state='generate' AND m.department_id='309023' ORDER BY order_code DESC
  
  
  SELECT * FROM delivery_order_main WHERE user_code='831204'  ORDER BY FROM_UNIXTIME(create_time) DESC