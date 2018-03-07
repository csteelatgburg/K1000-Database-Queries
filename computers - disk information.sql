--A custom inventory rule held the size of the Users folder on the machine
--Report shows the amount of space used on the drive and how much was used by user accounts
--Initially created to estimate amount of storage needed for implementing a backup solution
SELECT M.ID, M.NAME, D.NAME,
ROUND(DISK_SIZE, 0) as "Total Disk Available",
ROUND(DISK_USED, 0) as "Total Disk Used",
COUNT(SA.ID) as "Software Count",
ROUND(SUM(SA.FILE_SIZE)/1000000,2) as "Software size",
CASE
    WHEN M.OS_NAME like 'Mac%' THEN substring_index(MACUS.STR_FIELD_VALUE, "G", 1)
    WHEN M.OS_NAME like 'Microsoft%' THEN round(substring_index(substring(WINUS.STR_FIELD_VALUE, LOCATE("Sum      : ", WINUS.STR_FIELD_VALUE)+ 11), "<br/>", 1)/1000000000, 0)
END as UsersSize
FROM MACHINE M
LEFT JOIN MACHINE_DISKS D on M.ID = D.ID
LEFT JOIN SAM_MACHINE_JT on M.ID = SAM_MACHINE_JT.MACHINE_ID
LEFT JOIN KBSYS.SAM_APPLICATION SA ON SA.ID = SAM_MACHINE_JT.SAM_CATALOG_ID
LEFT JOIN MACHINE_CUSTOM_INVENTORY WINUS on M.ID = WINUS.ID and WINUS.SOFTWARE_ID = 85480
LEFT JOIN MACHINE_CUSTOM_INVENTORY MACUS on M.ID = MACUS.ID AND MACUS.SOFTWARE_ID = 85481

GROUP BY M.ID
