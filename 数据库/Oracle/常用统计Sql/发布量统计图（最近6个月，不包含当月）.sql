WITH t1 AS 
(SELECT 
TO_CHAR(add_months(to_date(to_char(trunc(sysdate, 'mm') + 1, 'yyyy-mm'), 'yyyy-mm'), -ROWNUM), 'yyyy-mm') as m
FROM dual
  CONNECT BY ROWNUM  <= 6
  ORDER BY TO_CHAR(add_months(to_date(to_char(trunc(sysdate, 'mm')+1, 'yyyy-mm'), 'yyyy-mm'), -(ROWNUM - 1)), 'yyyy-mm') ASC) 
SELECT
	t1.m month,
	count( t2.F_FOOTPRINT_ID ) count 
FROM
	t1
	LEFT JOIN TS_LOG_UPLOAD t2 ON t1.m = to_char( t2.F_RECORD_TIME, 'yyyy-mm' ) 
GROUP BY
	t1.m
ORDER BY
	t1.m;

SELECT 
TO_CHAR(add_months(to_date(to_char(trunc(sysdate, 'mm') + 1, 'yyyy-mm'), 'yyyy-mm'), -ROWNUM), 'yyyy-mm') as m
FROM dual
  CONNECT BY ROWNUM  <= 6
  ORDER BY TO_CHAR(add_months(to_date(to_char(trunc(sysdate, 'mm')+1, 'yyyy-mm'), 'yyyy-mm'), -(ROWNUM - 1)), 'yyyy-mm') ASC;

