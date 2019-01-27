WITH t1 AS 
( SELECT to_char(( TRUNC( SYSDATE, 'MM' ) + ROWNUM - 1 ),'yyyy-mm-dd' ) d FROM DUAL CONNECT BY ROWNUM <= TO_NUMBER(TO_CHAR( LAST_DAY( SYSDATE ), 'dd' ))) 
SELECT
	t1.d day,
	count( t2.F_USER_ID ) count 
FROM
	t1
	LEFT JOIN TS_LOG_VISIT t2 ON t1.d = to_char( t2.F_RECORD_TIME, 'yyyy-mm-dd' ) 
GROUP BY
	t1.d,
	t2.F_USER_ID
ORDER BY
	t1.d;