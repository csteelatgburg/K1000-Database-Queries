-- Simple dump of asset histor the the given machine name
SELECT ASSET_HISTORY.*
FROM ASSET_HISTORY
WHERE NAME = 'computername'
