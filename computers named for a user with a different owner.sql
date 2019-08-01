-- Our naming convention uses the primary user's name as the computer name
-- Report finds computers that are named for someone other than the primary user
-- Departmental and Lab computers are assigned to a generic user and they are excluded
-- Computers with a dash have a suffix and only the first part is the user name
SELECT M.NAME, M.OS_NAME, OWNER.USER_NAME, OWNER.FULL_NAME,
substring_index(M.NAME, "-", 1) as MBASENAME,
(SELECT COUNT(ID) FROM USER WHERE USER.USER_NAME = substring_index(M.NAME, "-", 1)) as USERCOMPUTERNAME,
NAMEDFOR.FULL_NAME as NamedFor,
NAMEDFORDESC.FIELD_VALUE  as NamedForDesc,
OWNERDESC.FIELD_VALUE as OwnerDesc
FROM MACHINE M
LEFT JOIN ASSET on ASSET.MAPPED_ID = M.ID
JOIN USER OWNER on OWNER.ID = ASSET.OWNER_ID
JOIN USER NAMEDFOR on NAMEDFOR.USER_NAME = substring_index(M.NAME, "-", 1)
JOIN USER_FIELD_VALUE NAMEDFORDESC on NAMEDFORDESC.FIELD_ID = 3 AND NAMEDFORDESC.USER_ID = NAMEDFOR.ID
JOIN USER_FIELD_VALUE OWNERDESC on OWNERDESC.FIELD_ID = 3 AND OWNERDESC.USER_ID = OWNER.ID

WHERE M.NAME not like concat(OWNER.USER_NAME, '%')
and OWNER.USER_NAME not like '%computer'
HAVING USERCOMPUTERNAME = 1
ORDER BY M.NAME
