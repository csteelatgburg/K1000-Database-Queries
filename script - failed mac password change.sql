SELECT MACHINE.NAME, max(KBOT_LOG.START_TIME), KBOT_LOG.STATUS, CLIENT_CONNECTED
FROM ORG1.KBOT_LOG 
JOIN MACHINE on MACHINE.ID = KBOT_LOG.MACHINE_ID
LEFT JOIN KBSYS.KUID_ORGANIZATION ON KUID_ORGANIZATION.KUID=MACHINE.KUID 
LEFT JOIN KBSYS.SMMP_CONNECTION ON SMMP_CONNECTION.KUID = MACHINE.KUID AND KUID_ORGANIZATION.ORGANIZATION_ID = 1
WHERE KBOT_ID = 1197
and STATUS = 3
GROUP BY MACHINE.NAME