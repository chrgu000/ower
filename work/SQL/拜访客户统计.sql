#根据用户分组求出订单总价格并倒序排列
SELECT SUM(s.total_price) AS total_price,SUM(s.num) AS order_count,m.order_code,user_code,FROM_UNIXTIME(gen_time)
 FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code IN ('803132','800469','825623','800005','804936') AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-31 00:00:00')
 AND s.order_state NOT IN ('cancelled', 'closed', 'agent_closed')
GROUP BY m.user_code 
ORDER BY total_price DESC

#查询某一时间段内某用户或某部门拜访情况
SELECT user_id,staff_name,salesman_code,salesman_name,visit_type,plan_status,visit_date,user_code,sbs_department_id,visit_place,FROM_UNIXTIME(create_time),
FROM_UNIXTIME(last_update_time) FROM sbs_visit_plan WHERE 
#salesman_code='80118' AND 
visit_date BETWEEN '2019-03-01' AND '2019-03-08'
AND plan_status NOT IN ('plan','cancelled')
#and visit_type='1'
AND visit_type='2'
#and sbs_department_id='63'

#查询用户表里业务员绑定了多少个用户
SELECT user_code,phone,customer_name,department_id,salesman_name FROM USER WHERE salesman_code='81089' AND state IN('active')

#and user_id like'%edi%' order by visit_date

#查询某个部门有多少业务员在职
SELECT * FROM salesman WHERE department_id='309012' AND employ_state='yes' 
#and employ_state ='yes'

SELECT * FROM sbs_department_id



SELECT order_code,user_code,order_total_price FROM orderinfo_main WHERE user_code IN('831204','805093')
 AND gen_time BETWEEN UNIX_TIMESTAMP('2019-03-01 00:00:00')AND UNIX_TIMESTAMP('2019-03-08 00:00:00')
 #查询
 SELECT
DISTINCT( market_name),salesman_code
FROM
	sbs_visit_plan
WHERE
	sbs_department_id = 12 AND 
plan_status  IN ('attended','reported')
AND visit_date BETWEEN '2019-03-07' AND '2019-03-07'

SELECT
DISTINCT (user_code)
FROM
	sbs_visit_plan
WHERE
	sbs_department_id = 12 AND 
plan_status  IN ('attended','reported') AND market_name IS NOT NULL AND user_code >0
AND visit_date BETWEEN '2019-03-01' AND '2019-03-13'

SELECT * FROM sbs_department_user AS de LEFT JOIN sbs_tag_user AS ta  ON de.user_id=ta.user_id LEFT JOIN sbs_user AS us ON us.user_id=de.user_id WHERE 
de.department_id='12' AND ta.tag_id='3' AND ta.state ='0' AND us.state='0'AND us.salesman_code='0'


81477  petrus   80350
 SELECT * FROM sbs_tag_user WHERE tag_id='3'AND tag_id='1'AND tag_id='14' 
 
 
 81378