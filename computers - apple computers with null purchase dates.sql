SELECT MACHINE.NAME, MACHINE.BIOS_SERIAL_NUMBER,

STR_TO_DATE(substring_index(substring_index(STR_FIELD_VALUE, '<br/>', 1), ': ', -1), '%m/%d/%Y') as WARRANTY,
STR_TO_DATE(substring_index(substring_index(STR_FIELD_VALUE, '<br/>', 2), ': ', -1), '%m/%d/%Y') as PURCHASE,
substring_index(substring_index(STR_FIELD_VALUE, '<br/>', 3), ': ', -1) as CONFIGURATION
FROM ORG1.MACHINE
LEFT JOIN MACHINE_CUSTOM_INVENTORY on MACHINE.ID = MACHINE_CUSTOM_INVENTORY.ID and SOFTWARE_ID = 86831
WHERE MACHINE.CS_MANUFACTURER like 'Apple%' 
ORDER BY MACHINE.NAME

