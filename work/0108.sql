SELECT user_code,phone FROM USER WHERE FROM_UNIXTIME(register_time)>=60;
SELECT DATE_SUB('2018-11-30 23:59:59',INTERVAL '60 1:1:1' DAY_SECOND),user_code,phone FROM USER 
SELECT * FROM USER WHERE user_code NOT IN (SELECT user_code FROM orderinfo_main ) AND 

SELECT m.user_code,m.shop_name,u.phone FROM orderinfo_main AS m LEFT JOIN USER AS u ON u.user_code=m.user_code
 WHERE FROM_UNIXTIME(gen_time)>1538208671 
 
 SELECT DISTINCT(user_code),shop_name,phone FROM orderinfo_main WHERE gen_time<UNIX_TIMESTAMP('2018-10-31')AND gen_time>UNIX_TIMESTAMP('2018-09-30')
SELECT user_code FROM orderinfo_main WHERE user_code NOT IN(SELECT user_code FROM orderinfo_main WHERE gen_time>UNIX_TIMESTAMP('2018-09-30')); 
SELECT * FROM USER WHERE user_code=824934

SELECT * FROM orderinfo_main WHERE user_code=824925
SELECT FROM_UNIXTIME(1424085200)
SELECT * FROM USER WHERE phone='085555555502'
SELECT * FROM goods_stock WHERE goods_id=100017

SELECT 
g.goods_id,country,state,g.produce_state,g.last_3month_soldnum ,s.warehouse_id,s.app_available_num  FROM goods AS g LEFT JOIN 
goods_stock AS s ON g.goods_id=s.goods_id WHERE g.last_3month_soldnum=0 AND s.app_available_num>0;



SELECT * FROM department WHERE department_id NOT IN(SELECT department )

SELECT * FROM orderinfo_main WHERE department_id NOT IN (SELECT department_id FROM department)

SELECT order_code,sub_id,goods_id,order_state,closed_user,closed_date,num,closed_quantity,line_close_person FROM orderinfo_sub WHERE order_code='SO2018010200095'

select order_code,sub_id,goods_id,order_state,closed_user,closed_date,num,closed_quantity,line_close_person from orderinfo_sub WHERE   order_state='delivered(part)'


select user_code from user where phone in('081212121212','081313131313')

select not_sales_area,shop_id from shop
select o.order_code,o.user_code,from_unixtime(u.register_time) from orderinfo_main as o left join user as u on o.user_code=u.user_code where u.user_code=831207


select customer_manage_type,user_code,phone from user where phone='085757575757'


select u.user_code,u.department_id,u.phone,f.province_code,f.freight,f.goods_id,u.province_code from
 user  u left join goods_freight  f on u.department_id=f.department_id where f.goods_id='100065' and u.user_code='831205'

SELECT activity_scene_id,country,activity_scene_name,sort,state FROM activity_scene  
 
select * from activity_scene 
order_code
update orderinfo_sub set order_state='close' where order_code in(select m.order_code,s.order_state from orderinfo_main m left join orderinfo_sub s on m.order_code=s.order_code where m.user_code='830639' and s.order_state='generate')


SELECT * FROM sales_invoice_main where invoice_code='SI201812180005'

select * from sales_invoice_sub where order_sub_id in(1986857,1986858,1986859)


SELECT order_code,sub_id,goods_id,order_state,closed_user,closed_date,total_price,total_actual_paid,num,actual_delivery_quantity FROM orderinfo_sub where order_code='SO2018121800012'


select * from goods_stock where goods_id in('100889','100567')and warehouse_id in (204,215)

select from_unixtime(gen_time),user_code,salesman_code from orderinfo_main where order_code='SO2018010200013' 
select s.order_code,s.order_state,s.goods_id from orderinfo_sub s left join orderinfo_main m on s.order_code=m.order_code where gen_time<1545714310
and s.order_state='generate' AND m.department_id=309023


select sub_id,order_code,order_state,goods_id,closed_date from orderinfo_sub where order_state='closed' 
and order_code='`sbs_tag_user`'
select order_state,closed_date from orderinfo_sub where closed_date<2018-12-25


select * from app_notice_record where replace_info like '%20181225%'
select * from sbs_tag_user where user_name like '%张安益%'


select * from goods where brand_id=10
select * from user where phone='081515151515'

select from_unixtime(gen_time),user_code,order_code,order_total_price from orderinfo_main where user_code='821639'and gen_time>1543593600

truncate table device_token
select * from device_token where user_code='830336'
SELECT
	SUM(total_price) AS total_price,
	count(DISTINCT main.order_code) AS count
FROM
	`orderinfo_main` `main`
LEFT JOIN `orderinfo_sub` `sub` ON `sub`.`order_code` = `main`.`order_code`
WHERE
	`user_code` = 821639
AND `order_state` IN (
	'booking',
	'generate',
	'delivered',
	'delivered(part)',
	'received',
	'billing',
	'finished',
	'finished(part)',
	'returned',
	'agent_purchased',
	'agent_generated',
	'agent_delivered',
	'agent_booking',
	'agent_accepted'
)
LIMIT 1
select * from user where 

select * from orderinfo_sub where order_code ='SO2018121400001'

select distinct (main.order_code),main.user_code,from_unixtime(gen_time),sub.order_state from orderinfo_main main left join orderinfo_sub sub on main.order_code=sub.order_code where gen_time>unix_timestamp('2018-12-01 00:00:00')and sub.order_state='generate'