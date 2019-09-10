-- count of tickets closed in date ranges per priority
-- uses case statements to count tickets
-- submitted as answer for https://www.itninja.com/question/trying-to-add-two-columns-for-percentage-values-24-hours-and-48-hours-of-closed-tickets-vs-total-open-tickets

SELECT YEAR(TIME_CLOSED), P.NAME, 
COUNT(T.ID) AS 'Total Opened',
SUM(CASE WHEN TIME_TO_SEC(TIMEDIFF(TIME_CLOSED, CREATED)) < 86400 THEN 1 ELSE 0 END) AS 'Within 1 Day',
ROUND((SUM(CASE WHEN TIME_TO_SEC(TIMEDIFF(TIME_CLOSED, CREATED)) < 86400 THEN 1 ELSE 0 END)/COUNT(T.ID))*100,0) as 'Within 1 Day%',
SUM(CASE WHEN TIME_TO_SEC(TIMEDIFF(TIME_CLOSED, CREATED)) BETWEEN 86401 and 172800 THEN 1 ELSE 0 END) AS 'Within 2 Days',
ROUND((SUM(CASE WHEN TIME_TO_SEC(TIMEDIFF(TIME_CLOSED, CREATED)) BETWEEN 86401 and 172800 THEN 1 ELSE 0 END)/COUNT(T.ID))*100, 2) AS 'Within 2 Days%'
FROM HD_TICKET T
JOIN HD_PRIORITY P on P.ID = T.HD_PRIORITY_ID
WHERE P.HD_QUEUE_ID = 2
and YEAR(TIME_CLOSED) = YEAR(NOW())
GROUP BY YEAR(TIME_CLOSED), P.ID