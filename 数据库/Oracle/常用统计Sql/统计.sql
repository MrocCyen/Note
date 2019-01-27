 select * from
        (select count(*) F_A from TB_USER) A,
        (select count(*) F_B from TB_USER where TO_DATE(F_REGISTRY_TIME,'yyyy-mm-dd hh24:mi:ss')>=trunc(sysdate,'MM') and ((last_day(sysdate))+1-1/86400)>=TO_DATE(F_REGISTRY_TIME,'yyyy-mm-dd hh24:mi:ss')) B,
        (select count(*) F_C from TS_LOG_VISIT where trunc(F_RECORD_TIME) = trunc(sysdate)) C,
        (select count(*) F_D from TS_LOG_VISIT where F_RECORD_TIME >=trunc(sysdate,'MM') and ((last_day(sysdate))+1-1/86400)>=F_RECORD_TIME) D,
        (select count(*) F_E from TS_LOG_VISIT) E,
        (select count(*) F_F from (select count(*) from TS_LOG_SHARE GROUP BY F_USER_ID)) F,
        (select count(*) F_G from TS_LOG_SHARE) G,
				(select count(*) F_H from TS_LOG_ONLINE where F_RECORD_TIME > SYSDATE-5/(24*60)) H
				
			
