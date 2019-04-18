SELECT COUNT(user_code) FROM USER WHERE state='active' AND department_id='309023'
#and freeze_time is null
#查询在职业务员及部门
SELECT * FROM salesman WHERE employ_state='yes'AND department_id='309023'
#查询业务员下在职的用户
SELECT salesman_name,user_code,department_id,state,freeze_time FROM USER WHERE state='active'AND salesman_code='80998'

SELECT r.theme_id,r.promotion_id,r.promotion_type,activity_theme,begin_time,end_time,join_condition,promote_type,user_code_gather,customer_levels 
FROM `promotion_theme_relation` AS `r` 
INNER JOIN `activity_promote` AS p ON p.id=r.promotion_id 
WHERE `p`.`state` != 'draft' AND `r`.`theme_id` = '6'

SELECT DISTINCT(promotion_id),theme_id,a.state,promotion_type,a.activity_theme FROM promotion_theme_relation AS p LEFT JOIN tiered_pricing AS t ON t.goods_id=p.promotion_id
LEFT JOIN `activity_promote` AS a ON a.id=p.promotion_id
WHERE p.theme_id='6' ;


#查询用户为僵死客户和2星级客户
SELECT COUNT(user_code),department_name FROM USER WHERE (customer_last_level ='4' OR customer_last_stars='2')
AND state='active' AND department_id='309023'

SELECT department_id,user_code,department_name,salesman_code FROM USER WHERE (customer_last_level ='4' OR customer_last_stars='2')
AND state='active' AND department_name IS NOT NULL 
AND salesman_name IS NOT NULL
#查询部门为空和没有业务编码的用户
SELECT department_id,user_code,department_name,salesman_code FROM USER WHERE
 state='active' AND (department_name IS  NULL 
OR salesman_name IS NULL)


SELECT COUNT(salesman_code) FROM salesman WHERE employ_state='yes'

SELECT user_code,salesman_code FROM USER WHERE state='active'


SELECT * FROM salesman WHERE department_id='309011'
SELECT user_code FROM USER WHERE salesman_code='81019' AND state='active'
#查询部门为分总的用户id
SELECT * FROM sbs_department_user AS de LEFT JOIN sbs_tag_user AS tag ON de.user_id=tag.user_id LEFT JOIN sbs_department AS dept ON 
dept.id=de.department_id LEFT JOIN sbs_tag AS T ON T.id=tag.tag_id LEFT JOIN sbs_user AS u ON u.user_id=tag.user_id
WHERE tag.state='0' AND de.state='0' AND T.id='3' AND dept.id='63' AND u.state='0'
#查询业务员对应的客户
SELECT COUNT(user_code) FROM USER WHERE salesman_code='81495' AND state='active'
#查询客户的详情
SELECT user_code,salesman_code,department_id,salesman_name FROM USER WHERE user_code='815815'
#查询客户订单详情
SELECT user_code,order_code,FROM_UNIXTIME(gen_time),order_total_price,order_total_quantity FROM orderinfo_main WHERE user_code='815815'


 fizoJgxyYGI:APA91bHvCP_r6pt6yHjgD2LfXQC7HiJnZJt6K8GaW4yGyHTS-TljVU4k1OktKjvETnEhlmJW0QGTe-jzEqAEJsb1N3Jaeu_TzwTSzgkauZ-mz1FNLBNj97YW1AS4HyxoHCvMrStUFyNm
 32773
 