--  A custom inventory rule contains machine information queried from Apple GSX
--  This report displays that information in a human readable form
SELECT MACHINE.NAME, MACHINE.BIOS_SERIAL_NUMBER,

STR_TO_DATE(substring_index(substring_index(PI.STR_FIELD_VALUE, '<br/>', 1), ': ', -1), '%m/%d/%Y') as WARRANTY,
STR_TO_DATE(substring_index(substring_index(PI.STR_FIELD_VALUE, '<br/>', 2), ': ', -1), '%m/%d/%Y') as PURCHASE,
substring_index(substring_index(PI.STR_FIELD_VALUE, '<br/>', 3), ': ', -1) as CONFIGURATION
FROM ORG1.MACHINE
LEFT JOIN MACHINE_CUSTOM_INVENTORY PI on MACHINE.ID = PI.ID and SOFTWARE_ID = 86831
WHERE MACHINE.CS_MANUFACTURER like 'Apple%'

ORDER BY MACHINE.NAME
