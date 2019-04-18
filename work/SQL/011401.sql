SELECT user_code,m.order_code,FROM_UNIXTIME(gen_time) '下单时间',department_id,salesman_code,agent_id,order_total_price,order_total_quantity,s.order_state 
	FROM orderinfo_main  m LEFT JOIN orderinfo_sub s ON m.order_code = s.order_code
	WHERE FROM_UNIXTIME(gen_time,'%Y-%m') = '2018-11'  AND department_id = '309012'
	 AND user_code = '810584' 
	 #and order_state='returned';
	
#根据上月发货单金额判断星级等级	
	SELECT
	order_code,user_code,
	SUM(total_price_with_tax) AS total_price,s.delivery_code,m.order_type
FROM
	delivery_order_sub AS s
LEFT JOIN delivery_order_main AS m ON s.delivery_code = m.delivery_code
WHERE
	m.order_type = 'delivery'
	AND
	 m.create_time BETWEEN UNIX_TIMESTAMP('2018-12-01 00:00:00')AND UNIX_TIMESTAMP('2018-12-31 23:59:59')
	AND user_code='805720'
	AND order_code IN('SO2018110500640','SO2018111200868','SO2018111300588')
	 
SELECT DISTINCT(user_code),m.order_code,FROM_UNIXTIME(gen_time) '下单时间',department_id,salesman_code,agent_id,order_total_price,order_total_quantity,s.order_state 
	FROM orderinfo_main  m LEFT JOIN orderinfo_sub s ON m.order_code = s.order_code
	WHERE FROM_UNIXTIME(gen_time,'%Y-%m') = '2019-01'  AND order_state IN('returned','cancelled')AND department_id = '309014'
	
	
	SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='825734' AND m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-12 14:59:59')


SELECT * FROM user_star_log WHERE user_code IN ('803022','803022','803022','803022','803022','827823',
'806379','823279','831742','809718','809147','821072','830469','820915','818356','818356','815030','831190',
'815369','829738','828144','830442','803822','831792','826461','826461','830274','809763','827089','826300','803192',
'816996','830942','820632','826039','816996','821750','828874','830442','822776','805085','817352','803022','831604',
'821998','823243','821100','829214','825384','824960','826983','816148','817422','808593','824304','817836','817388',
'826787','803192','831775','822480','823426','826039','828953','830451','815108','803095','828725','815369','824176','827654',
'827654','804552','814099','828770','817377','831300','824881','830880','812115','825030','819948','823747','816779','823705',
'813241','830571','831904','823571','828730','821337','800469','823664','831623','820958','831300','811159','829199','827534',
'805375','818422','816917','831782','816829','829832','817490','823062','830442','805097','800005','815275','815275','819765',
'823748','826039','831899','804372','830317','803957','823869','829587','817404','805720','826015','804434','816917','826983',
'805720','815131','823735','831932','830725','830827','818525','825734','815275','819901','822002','830827','826521','803022',
'831948','822921','803022','803022','819795','817053','821299','829072','831951','819182','821739','828399','822887','826126',
'820266','823895','828913','825589','824225','815942','828956','814060','810805','831763','817234','829384','826694','818205',
'821299','825589','831194','800469','829918','805205','819774','831998','827834','805560','809694','827774','809718','826395',
'812203','824303','805000','814975','800005','827188','827280','826983','831840','828788','832024','826108','826108','811672
831798','831135','831135','804196','820182')

#计算客户本月下单，并且子订单不包含cancelled
SELECT SUM(order_total_price),SUM(order_total_quantity) FROM (SELECT DISTINCT(m.order_code),FROM_UNIXTIME(gen_time),m.user_code,m.order_total_price,m.order_total_quantity,s.`order_state`,goods_id
FROM orderinfo_main m LEFT JOIN orderinfo_sub s ON m.order_code=s.`order_code`
WHERE m.user_code='805720' AND
 m.gen_time BETWEEN UNIX_TIMESTAMP('2019-01-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-13 16:00:00')
GROUP BY m.order_code
 HAVING s.order_state NOT IN ('cancelled')) AS orderinfo
 
 #excel数据导出星级奖牌总数
SELECT  COUNT(DISTINCT(user_code)),star_level,COUNT(medal_level),star_date FROM user_star_log WHERE star_date BETWEEN('2018-08') AND('2019-01')AND star_level>'0' 


SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE salesman_code='80998' AND department_id='309023' AND star_date =('2019-01') AND star_level>'0'
	
	