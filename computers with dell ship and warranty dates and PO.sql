-- Pulls data from Dell asset tables
-- Includes custom field from computer asset containing the PO Number
-- Uses maximum warranty end date as some machines have multiple warranties
SELECT DISTINCT(MACHINE.NAME),
MACHINE.OS_NAME,
MACHINE.CS_MODEL,
MACHINE.CS_MANUFACTURER,
DA.SHIP_DATE AS "Ship Date",
MAX(DW.END_DATE) AS "Warranty End Date",
DW.SERVICE_LEVEL_DESCRIPTION as "Service Level",
ASSETDATA.FIELD_32 as "PO Number"
FROM MACHINE
LEFT JOIN DELL_ASSET DA on MACHINE.BIOS_SERIAL_NUMBER = DA.SERVICE_TAG
LEFT JOIN DELL_WARRANTY DW on MACHINE.BIOS_SERIAL_NUMBER = DW.SERVICE_TAG
LEFT JOIN ASSET on ASSET.NAME = MACHINE.BIOS_SERIAL_NUMBER
LEFT JOIN ASSET_DATA_5 ASSETDATA on ASSETDATA.ID = ASSET.ASSET_DATA_ID
WHERE MACHINE.CS_MANUFACTURER like 'Dell%'
GROUP BY MACHINE.NAME
ORDER BY "Ship Date", MACHINE.NAME
