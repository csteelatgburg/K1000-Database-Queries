--This report is run on the first of the month and the users are asked to take a survey
SELECT
DISTINCT(S.EMAIL) AS EMAIL,
S.FULL_NAME AS FULLNAME,
HD_TICKET.TIME_CLOSED
FROM HD_TICKET
LEFT JOIN USER S ON (S.ID = HD_TICKET.SUBMITTER_ID)
WHERE
HD_TICKET.TIME_CLOSED BETWEEN date_format(NOW() - INTERVAL 1 MONTH, '%Y-%m-01') AND last_day(NOW() - INTERVAL 1 MONTH)
AND S.EMAIL like '%@dickinson.edu'
ORDER BY S.FULL_NAME asc
