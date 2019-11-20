-- Report of computer assets without a department associated
-- Assumes:
-- the computer asset type has a custom field for the department asset type
-- Computers are assigned to users
-- Users have a custom field for their department
-- See comments below for custom field 

SELECT ASSET.ID as 'ID', 
ASSET.NAME as 'Asset Name', 
MACHINE.NAME as 'Machine Name',
USER.FULL_NAME as 'Owner Name',
USER_DEPARTMENT.FIELD_VALUE as 'User Department',
ASSET_DEPARTMENT.NAME as 'Asset Department Name',
ASSET_DEPARTMENT.ID as 'Asset Department ID'
FROM ASSET
-- update the value of 10029 to the ASSET_FIELD_ID for the custom field ID on your SMA
-- This value is found in the ASSET_FIELD_DEFINITION table 
LEFT JOIN ASSET_ASSOCIATION on ASSET_ASSOCIATION.ASSET_ID = ASSET.ID and ASSET_ASSOCIATION.ASSET_FIELD_ID = 10029
LEFT JOIN MACHINE on MACHINE.ID = ASSET.MAPPED_ID
LEFT JOIN USER on USER.ID = ASSET.OWNER_ID
-- update the value of 4 to the USER_FIELD ID 
-- This value is found in the USER_FIELD_DEFINITION table
LEFT JOIN USER_FIELD_VALUE USER_DEPARTMENT on USER_DEPARTMENT.FIELD_ID = 4 and USER_DEPARTMENT.USER_ID = ASSET.OWNER_ID
LEFT JOIN ASSET ASSET_DEPARTMENT on ASSET_DEPARTMENT.NAME = USER_DEPARTMENT.FIELD_VALUE
WHERE ASSET_ASSOCIATION.ASSOCIATED_ASSET_ID is null
AND MACHINE.NAME is not null
AND ASSET.ASSET_TYPE_ID = 5
AND USER_DEPARTMENT.FIELD_VALUE != ''
AND ASSET_DEPARTMENT.ID is not null


