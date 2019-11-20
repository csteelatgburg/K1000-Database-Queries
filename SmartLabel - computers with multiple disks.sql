-- Smart Label - Computers with multiple disks
-- Submitted as answer to https://www.itninja.com/question/how-to-create-a-dynamic-label-to-capture-all-windows-machines-with-more-drives-than-just-c

SELECT MACHINE.NAME AS SYSTEM_NAME, SYSTEM_DESCRIPTION, MACHINE.IP, 
MACHINE.MAC, MACHINE.ID as TOPIC_ID,
count(D.ID) as DISKCOUNT
FROM ORG1.MACHINE 
JOIN MACHINE_DISKS D on MACHINE.ID = D.ID
WHERE MACHINE.OS_NAME like "%Windows%"
GROUP BY MACHINE.ID
HAVING DISKCOUNT > 1