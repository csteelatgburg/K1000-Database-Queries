SELECT T.ID, T.TITLE, T.RESOLUTION,
GROUP_CONCAT(C.COMMENT) as COMMENTS,
CREATED
FROM ORG1.HD_TICKET T
JOIN HD_TICKET_CHANGE C on C.ID = T.ID
WHERE MONTH(T.CREATED) = "08" 
and YEAR(T.CREATED) = "2011"
GROUP BY T.ID
HAVING COMMENTS REGEXP 'malware|virus|combofix|mbam|ccleaner'
or T.RESOLUTION REGEXP 'malware|virus|combofix|mbam|ccleaner'
or T.TITLE REGEXP 'malware|virus|combofix|mbam|ccleaner'
