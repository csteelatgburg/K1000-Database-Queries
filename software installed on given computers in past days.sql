SELECT ASSET_HISTORY.ASSET_ID, 
ASSET_HISTORY.TIME, 
ASSET_HISTORY.VALUE1,
ASSET_HISTORY.VALUE2,
ASSET_HISTORY.USER_TEXT,
MACHINE.NAME
FROM  ASSET_HISTORY
JOIN ASSET ON ASSET.ID = ASSET_HISTORY.ASSET_ID
JOIN MACHINE ON ASSET.NAME = MACHINE.BIOS_SERIAL_NUMBER
WHERE CHANGE_TYPE = "Detected"
AND FIELD_NAME = "SOFTWARE"
AND DATE(ASSET_HISTORY.TIME)> DATE_SUB(NOW(), INTERVAL 7 day)
AND MACHINE.NAME LIKE 'lib-ic-%'