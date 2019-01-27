WITH t1 AS 
( SELECT to_char(( TRUNC( SYSDATE, 'dd' ) - ROWNUM ),'yyyy-mm-dd' ) d FROM dual  CONNECT BY ROWNUM <= 7) 
SELECT
	t1.d day,
	count( t2.F_FOOTPRINT_ID ) count 
FROM
	t1
	LEFT JOIN TS_LOG_UPLOAD t2 ON t1.d = to_char( t2.F_RECORD_TIME, 'yyyy-mm-dd' ) 
GROUP BY
	t1.d 
ORDER BY
	t1.d;

SELECT to_char(( TRUNC( SYSDATE, 'dd' ) - ROWNUM ),'yyyy-mm-dd' ) day FROM dual  CONNECT BY ROWNUM <= 7;

