--A custom inventory rule contains the output of the AdobeExpiryDate utility from Adobe
--See https://helpx.adobe.com/enterprise/kb/volume-license-expiration-check.html for the utility
--Report shows computers that have a license expiring based on the utilities output
SELECT MACHINE.NAME, 
substring_index(substring_index(PI.STR_FIELD_VALUE, '<br/>------------------------------------------------------------------------------------------------------<br/><br/>', 2), '<br/>------------------------------------------------------------------------------------------------------<br/><br/>', -1) as Expiry

FROM ORG1.MACHINE
LEFT JOIN MACHINE_CUSTOM_INVENTORY PI on MACHINE.ID = PI.ID and SOFTWARE_ID = 109220
WHERE MACHINE.CS_MANUFACTURER like 'Apple%'
and STR_FIELD_VALUE is not null
HAVING Expiry not like "<br/>No expiring/expired%"
ORDER BY MACHINE.NAME
