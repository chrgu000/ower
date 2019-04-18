SELECT * FROM sbs_department_user AS de LEFT JOIN sbs_tag_user AS ta  ON de.user_id=ta.user_id LEFT JOIN sbs_user AS us ON us.user_id=de.user_id WHERE 
de.department_id='12' AND ta.tag_id='3`sbs_tag_user`' AND ta.state ='0' AND us.state='0'


SELECT SUM(s.total_price) AS total_price,SUM(s.num) AS order_count,m.order_code,user_code,FROM_UNIXTIME(gen_time)
 FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.department_id='309012' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')AND UNIX_TIMESTAMP('2019-03-08 00:00:00')
 AND s.order_state NOT IN ('cancelled', 'closed', 'agent_closed')
GROUP BY m.user_code 
ORDER BY total_price DESC

SELECT salesman_code FROM salesman WHERE department_id='309012'


SELECT * FROM salesman WHERE department_id='309012' AND employ_state='yes' 

 SELECT
DISTINCT(user_code),salesman_code
FROM
	sbs_visit_plan
WHERE
	sbs_department_id =12 
	AND 
plan_status  IN ('attended','reported')
AND visit_date BETWEEN '2019-03-11' AND '2019-03-11'


SELECT * FROM sbs_visit_plan WHERE department_id='309034' AND plan_status  IN ('attended','reported') AND market_name IS NOT NULL AND user_code >0
AND visit_date BETWEEN '2019-03-01' AND '2019-03-13'



