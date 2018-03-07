--Custom inventory field contains Apple purchase information from Apple GSX
--The script that collects that information had a bug and some machines had
--an incorrect serial number 
SELECT NAME, MAC, IP, OS_NAME, OS_NUMBER, BIOS_SERIAL_NUMBER,
SUBSTR(W.STR_FIELD_VALUE, LOCATE("Serial Number", W.STR_FIELD_VALUE)+24, LENGTH(BIOS_SERIAL_NUMBER)) as FileSerialNumber

FROM ORG1.MACHINE
JOIN MACHINE_CUSTOM_INVENTORY W on W.ID = MACHINE.ID and W.SOFTWARE_ID = 59336
JOIN MACHINE_CUSTOM_INVENTORY P on P.ID = MACHINE.ID and P.SOFTWARE_ID = 25152
HAVING BIOS_SERIAL_NUMBER != FileSerialNumber
ORDER BY NAME;
