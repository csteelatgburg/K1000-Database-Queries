-- Tickets created in the past month that contain given keywords in the title, resolution, summary or comments


SELECT T.ID, T.TITLE, T.RESOLUTION, T.SUMMARY,
GROUP_CONCAT(C.COMMENT) as COMMENTS,
CREATED
FROM ORG1.HD_TICKET T
JOIN HD_TICKET_CHANGE C on C.ID = T.ID
WHERE T.CREATED > DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY T.ID
HAVING COMMENTS REGEXP 'malware|virus|combofix|mbam|ccleaner'
or T.RESOLUTION REGEXP 'malware|virus|combofix|mbam|ccleaner'
or T.TITLE REGEXP 'malware|virus|combofix|mbam|ccleaner'
or T.SUMMARY REGEXP 'malware|virus|combofix|mbam|ccleaner'
