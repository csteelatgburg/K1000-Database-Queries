-- Smart label query to identify computers with Intel Wireless NICs
-- Submitted as an answer to https://www.reddit.com/r/kace/comments/cz9234/smart_label_help/

SELECT MACHINE.NAME AS SYSTEM_NAME, SYSTEM_DESCRIPTION, MACHINE_NICS.NIC, MACHINE.IP, MACHINE.MAC, MACHINE.ID as TOPIC_ID 
FROM MACHINE
JOIN MACHINE_NICS on MACHINE_NICS.ID = MACHINE.ID
WHERE MACHINE_NICS.NIC like '%Intel%Wireless%'