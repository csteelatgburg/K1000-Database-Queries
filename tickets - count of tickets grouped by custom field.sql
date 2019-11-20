-- Count of tickets opened in the past seven days grouped by custom field
-- submitted as answer to https://www.itninja.com/question/service-desk-reports-based-on-department

SELECT CUSTOM_FIELD_VALUE10, COUNT(ID)
FROM ORG1.HD_TICKET
WHERE CREATED > DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY CUSTOM_FIELD_VALUE10
