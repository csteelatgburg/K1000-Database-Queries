-- Associate computer asset owner's department with the asset
-- Used for a Custom Ticket Rule to add a department to an asset
-- See 'assets - computer assets without an associated department.sql' for the select statement
-- Assumes:
-- the computer asset type has a custom field for the department asset type
-- Computers are assigned to users
-- Users have a custom field for their department
-- See comments below for custom field IDs that need to be adjusted

INSERT INTO ASSET_ASSOCIATION 
SELECT 
ASSET.ID, 
-- update the value of 10029 to the ASSET_FIELD_ID for the custom field ID on your SMA
-- This value is found in the ASSET_FIELD_DEFINITION table 
10029 as ASSET_FIELD_ID,
ASSET_DEPARTMENT.ID as 'ASSOCIATED_ASSET_ID'

FROM ASSET 
LEFT JOIN USER on USER.ID = ASSET.OWNER_ID
-- update the value of 4 to the USER_FIELD ID 
-- This value is found in the USER_FIELD_DEFINITION table
LEFT JOIN USER_FIELD_VALUE USER_DEPARTMENT on USER_DEPARTMENT.FIELD_ID = 4 and USER_DEPARTMENT.USER_ID = ASSET.OWNER_ID
LEFT JOIN ASSET ASSET_DEPARTMENT on ASSET_DEPARTMENT.NAME = USER_DEPARTMENT.FIELD_VALUE
WHERE ASSET.ID in (<TICKET_IDS>)

