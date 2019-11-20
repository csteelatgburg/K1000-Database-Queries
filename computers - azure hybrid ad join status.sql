-- Report of Windows computers Azure AD Hybrid Join status based on output of script
-- Script runs c:\windows\sysnative\dsregcmd.exe /status
-- Checks log for AzureAdJoined and returns status or error

SELECT KBOT_LOG_LATEST.TIMESTAMP, MACHINE.NAME, 
-- instr(KBOT_LOG_DETAIL.TEXT, 'AzureAdJoined'), 
CASE 
	WHEN instr(KBOT_LOG_DETAIL.TEXT, 'AzureAdJoined') > 1 THEN substring(KBOT_LOG_DETAIL.TEXT, instr(KBOT_LOG_DETAIL.TEXT, 'AzureAdJoined') + 15, 4)
	ELSE 'Error'
END AS 'Azure Joined'
FROM ORG1.KBOT_LOG_LATEST
JOIN KBOT_LOG on KBOT_LOG.ID = KBOT_LOG_LATEST.KBOT_LOG_ID
JOIN KBOT_LOG_DETAIL on KBOT_LOG_DETAIL.ID = KBOT_LOG.OUTPUT_DETAIL_ID
JOIN MACHINE on MACHINE.ID = KBOT_LOG.MACHINE_ID
WHERE KBOT_LOG.KBOT_ID = 1880
AND MACHINE.OS_NAME like '%Win%10%'
ORDER BY MACHINE.NAME
