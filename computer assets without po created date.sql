-- Report to identify computers that don't have a value in the custom field FIELD_10013
-- This field is normally populated in my environment based on the PO Number stored in FIELD_32
-- The PO Number equates to a ticket in the service desk and a rule sets FIELD_10013 based on that ticket's created date
SELECT M.ID, M.NAME, A.NAME, AD.FIELD_32 as PONumber, AD.FIELD_10013 as POCreated,
M.LAST_INVENTORY,
M.CS_MANUFACTURER, M.CS_MODEL,
M.OS_NAME
FROM ORG1.MACHINE M
JOIN ASSET A on A.MAPPED_ID = M.ID
JOIN ASSET_DATA_5 AD on AD.ID = A.ASSET_DATA_ID

WHERE FIELD_10013 is null
