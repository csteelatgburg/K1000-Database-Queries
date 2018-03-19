-- Example report to determine how many clients were upgraded after release of an upgrade.
SELECT * FROM ORG1.ASSET_HISTORY
JOIN MACHINE on ASSET_HISTORY.MACHINE
WHERE FIELD_NAME = "CLIENT_VERSION"
and VALUE2 = "5.5.25198"
and TIME > DATE_SUB(NOW(), INTERVAL 7 DAY);
