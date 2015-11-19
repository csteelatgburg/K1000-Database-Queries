SELECT MACHINE.NAME,
REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(STR_FIELD_VALUE, "-------------------------------------------------------------------------------<br/>", -1), "<br/>The command completed successfully.", 1), "<br/>", ",") AS ADMINS
FROM ORG1.MACHINE_CUSTOM_INVENTORY 
JOIN MACHINE on MACHINE.ID = MACHINE_CUSTOM_INVENTORY.ID
WHERE SOFTWARE_ID = 22066
AND LOCATE("-------------------------------------------------------------------------------", STR_FIELD_VALUE) > 0

