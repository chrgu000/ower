SELECT
	sot.task_id AS '任务ID',
#	stth.task_id AS 'stthID',
#	sot.parent_task_id AS '任务父ID',
	stp.task_id AS '问题ID',
	sot.user_code AS '用户编号',
	FROM_UNIXTIME(stth.contact_time) AS '联系时间',
	sot.department_id AS '部门ID',
	sot.task_result AS 'sot任务结果',
	stth.task_result AS 'stth任务结果',
	sot.creator AS '创建人',
	sot.update_person AS '更新人',
	sot.operator_id AS 'sot跟进人ID' ,
#	stth.operator_id AS 'stth跟进人ID'
	stp.solver AS '问题解决人',
	FROM_UNIXTIME(stp.solver_time) AS '问题解决时间',
	stp.state AS '问题状态'
FROM
	`sbs_operations_task` AS sot
LEFT JOIN `sbs_task_track_history` AS stth ON sot.task_id = stth.task_id
LEFT JOIN `sbs_task_problem` AS stp ON stp.task_id = sot.task_id
WHERE
	/*stth.task_result IN (
		'complete_result',
		'complete_no_result'
		'following'
	)
AND */stth.contact_time > UNIX_TIMESTAMP('2018-12-01 00:00:00')
AND stth.contact_time < UNIX_TIMESTAMP('2019-12-31 23:59:59')
AND sot.update_person = 'geovanianggasta'
#AND stp.task_id IS NOT NULL #反馈问题数
#AND stp.state > '0'		#问题解决数
#AND stp.solver='novi'
#AND sot.parent_task_id > '0'
#GROUP BY
#	user_code