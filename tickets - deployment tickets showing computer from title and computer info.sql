SELECT T.ID, T.TITLE, S.NAME as 'Status', O.FULL_NAME as 'Owner', C.NAME as 'Category', 
trim(substring_index(replace(substring_index(T.TITLE, ' -', 2), 'Deployment -', ''), '-', 2)) as 'Computer',
M.LAST_INVENTORY,
ASSETOWNER.FULL_NAME as 'Assigned User'
FROM HD_TICKET T
JOIN HD_STATUS S on S.ID = T.HD_STATUS_ID
JOIN USER O on O.ID = T.OWNER_ID
JOIN HD_CATEGORY C on C.ID = T.HD_CATEGORY_ID
LEFT JOIN MACHINE M on M.NAME = trim(substring_index(replace(substring_index(T.TITLE, ' -', 2), 'Deployment -', ''), '-', 2))
LEFT JOIN ASSET A on A.MAPPED_ID = M.ID and A.ASSET_TYPE_ID = 5
LEFT JOIN USER ASSETOWNER on ASSETOWNER.ID = A.OWNER_ID
WHERE S.STATE != 'closed'
and C.NAME like 'Deployment::%'


