--Custom inventory rule contains the administrators on Windows machines
--Report shows information in a more readable format 
SELECT MACHINE.NAME, MACHINE.OS_NAME, MACHINE.CS_MODEL, MACHINE.CS_MANUFACTURER,
replace(replace(MCI.STR_FIELD_VALUE, 'Alias name     Administrators<br/>Comment        Administrators have complete and unrestricted access to the computer/domain<br/><br/>Members<br/><br/>-------------------------------------------------------------------------------<br/>Administrator<br/>', ""), 'FAS\\Domain Admins<br/>', "") as Administrators
FROM MACHINE
LEFT JOIN MACHINE_CUSTOM_INVENTORY MCI on MACHINE.ID = MCI.ID and SOFTWARE_ID = 22066
WHERE MACHINE.OS_NAME like "Microsoft%"
ORDER BY MACHINE.NAME
