--Active employees have a description that includes EMP_ACTIVE or EMPLOYEE
--Report shows computers that are assigned to a user that is not an active employee

SELECT M.NAME, M.OS_NAME, OWNER.USER_NAME as "UserName", OWNER.FULL_NAME as "Owner",
OWNERDESC.FIELD_VALUE as "Owner Desciption",
M.USER_FULLNAME as "Last User",
M.LAST_INVENTORY as "Last Inventory"
FROM MACHINE M
JOIN ASSET on ASSET.MAPPED_ID = M.ID
JOIN USER OWNER on OWNER.ID = ASSET.OWNER_ID

JOIN USER_FIELD_VALUE OWNERDESC on OWNERDESC.FIELD_ID = 3 AND OWNERDESC.USER_ID = OWNER.ID

WHERE (
OWNERDESC.FIELD_VALUE not like "%EMP_ACTIVE%"
and OWNERDESC.FIELD_VALUE != "EMPLOYEE")
and OWNER.USER_NAME not like '%computer'

ORDER BY M.NAME
