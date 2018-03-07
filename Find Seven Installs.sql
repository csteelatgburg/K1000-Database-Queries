--There was a problem with Spotlight not indexing properly
--This report found computers with only a few software titles installed
--This was a symptom of Spotlight being broken
SELECT InstallCounts.MACHINE_ID as MID, InstallCounts.Installs as Installs,
MACHINE.NAME, MACHINE.OS_NAME, CLIENT_VERSION, MACHINE.LAST_INVENTORY
from (SELECT MACHINE_ID, COUNT(*) as Installs FROM ORG1.MACHINE_SOFTWARE_JT MSJT
GROUP BY MACHINE_ID) as InstallCounts
JOIN MACHINE on MACHINE.ID = InstallCounts.MACHINE_ID
where Installs < 10;
