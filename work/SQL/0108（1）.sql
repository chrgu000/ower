SELECT DISTINCT user_code,order_code,FROM_UNIXTIME(gen_time) FROM orderinfo_main WHERE user_code NOT IN (SELECT * FROM USER WHERE user_code  IN (SELECT user_code FROM orderinfo_main WHERE gen_time BETWEEN UNIX_TIMESTAMP('2018-11-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-01 09:40:00'))
)AND gen_time<UNIX_TIMESTAMP('2018-11-01 00:00:00')AND department_id=309023 ORDER BY user_code DESC #816168

SELECT DISTINCT(user_code),order_code,FROM_UNIXTIME(gen_time)  FROM orderinfo_main WHERE gen_time<UNIX_TIMESTAMP('2018-11-01 00:00:00')AND department_id=309023#821435


SELECT order_code,FROM_UNIXTIME(gen_time),user_code FROM orderinfo_main WHERE gen_time BETWEEN UNIX_TIMESTAMP('2018-11-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-01 09:40:00')AND department_id=309023


SELECT * FROM sbs_task_track_history WHERE operator_id='pengzhipeng'

SELECT user_code,phone,department_id FROM USER WHERE user_code NOT IN (SELECT user_code FROM orderinfo_main WHERE gen_time BETWEEN UNIX_TIMESTAMP('2018-11-01 00:00:00')AND UNIX_TIMESTAMP('2019-01-01 09:40:00'))AND department_id=309023