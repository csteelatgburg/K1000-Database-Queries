-- This query will identify computers assigned to a location that is not a top level location
-- We assign computers to the top level location but sometimes someone picks the wrong location asset
SELECT A.ID, M.NAME, A.NAME, A.LOCATION_ID, L.NAME as "Location",
M.LAST_INVENTORY, 
M.CS_MANUFACTURER, M.CS_MODEL,
M.OS_NAME
FROM ORG1.MACHINE M
JOIN ASSET A on A.MAPPED_ID = M.ID and A.ASSET_TYPE_ID = 5
JOIN ASSET_DATA_5 AD on AD.ID = A.ASSET_DATA_ID
JOIN ASSET L on L.ID = A.LOCATION_ID
JOIN ASSET_HIERARCHY on ASSET_HIERARCHY.CHILD_ASSET_ID = L.ID

WHERE ASSET_HIERARCHY.PARENT_ASSET_ID != 0
