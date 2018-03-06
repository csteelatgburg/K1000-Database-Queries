SELECT MACHINE.NAME, 
CASE 
	WHEN PI.STR_FIELD_VALUE like "%<br/>No expiring/expired%" THEN "No license expiring"
    ELSE substring_index(substring_index(PI.STR_FIELD_VALUE, '<br/>------------------------------------------------------------------------------------------------------<br/><br/>', 2), '<br/>------------------------------------------------------------------------------------------------------<br/><br/>', -1) 
END AS Expiry
FROM ORG1.MACHINE
LEFT JOIN MACHINE_CUSTOM_INVENTORY PI on MACHINE.ID = PI.ID and SOFTWARE_ID = 109220
WHERE STR_FIELD_VALUE is not null
ORDER BY MACHINE.NAME

