select * from orderinfo_sub where order_code='SO2019010500430'
select * from goods where goods_id in('101583','101745')

 SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('2019-12')
  #GROUP BY user_code 
 #HAVING COUNT(star_level)>2
 AND user_code='805720'

  SELECT DISTINCT(user_code),star_level,medal_level,star_date FROM 
(SELECT user_code,star_level,medal_level,star_date FROM user_star_log WHERE star_date BETWEEN ('2018-07')AND ('201-01'))as lev
 WHERE 
star_date =('2019-01')
 #AND user_code='803022'
 AND medal_level='1'
 ORDER BY user_code ASC
#统计星级奖牌总人数

select  count(DISTINCT(user_code)),star_level,medal_level,star_date from user_star_log where star_date =('2019-01') and user_code='805720'
and medal_level='5' 
and star_level>'0'




#excel数据导出星级奖牌总数
select  count(DISTINCT(user_code)),star_level,count(medal_level),star_date from user_star_log where star_date between('2018-08') and('2019-01')and star_level>'0' 


select  count(DISTINCT(user_code)),star_level,medal_level,star_date from user_star_log where star_date>='2018-07' and star_date<='2018-12' and medal_level!='0'