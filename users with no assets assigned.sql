-- Users with no assets assigned
-- submitted as answer for https://www.itninja.com/question/users-without-an-asset-associated

SELECT USER_NAME, FULL_NAME, COUNT(ASSET.ID) AS ASSETCOUNT
FROM ORG1.USER
LEFT JOIN ASSET on ASSET.OWNER_ID = USER.ID
GROUP BY USER.ID
HAVING ASSETCOUNT = 0
