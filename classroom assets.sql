-- Report of custom asset used for tracking classrooms
SELECT  ASSET.NAME,
L0.NAME as "Building",
AD.FIELD_46 as 'Room Number',
AD.FIELD_47 as 'Tech Type',
AD.FIELD_48 as 'Instructor Computer',
AD.FIELD_49 as 'Student Computers',
AD.FIELD_50 as '# Computers'
FROM ASSET
LEFT JOIN ASSET_DATA_9 AD ON AD.ID = ASSET.ASSET_DATA_ID
LEFT JOIN ASSET_ASSOCIATION J0 ON J0.ASSET_FIELD_ID = 45 AND J0.ASSET_ID = ASSET.ID
LEFT JOIN ASSET L0 ON L0.ID = J0.ASSOCIATED_ASSET_ID

where ASSET.ASSET_TYPE_ID = 9
GROUP BY ASSET.ID
ORDER BY ASSET.NAME
