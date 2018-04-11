-- Out naming convention uses the primary user's name as the computer name
-- Report finds computers that have a name that matches a username but is not assigned to that user 
SELECT M.NAME, M.OS_NAME, OWNER.USER_NAME, OWNER.FULL_NAME,
substring_index(M.NAME, "-", 1) as MBASENAME,
(SELECT COUNT(ID) FROM USER WHERE USER.USER_NAME = substring_index(M.NAME, "-", 1)) as USERCOMPUTERNAME,
OWNERDESC.FIELD_VALUE as OwnerDesc
FROM MACHINE M
LEFT JOIN ASSET on ASSET.MAPPED_ID = M.ID
JOIN USER OWNER on OWNER.ID = ASSET.OWNER_ID
JOIN USER_FIELD_VALUE OWNERDESC on OWNERDESC.FIELD_ID = 3 AND OWNERDESC.USER_ID = OWNER.ID

WHERE OWNER.USER_NAME not like '%computer'
HAVING USERCOMPUTERNAME = 0
ORDER BY M.NAME
