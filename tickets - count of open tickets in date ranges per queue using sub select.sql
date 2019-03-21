-- count of tickets opened in date ranges per queue
-- uses sub select statements to count tickets
-- submitted as answer for https://www.itninja.com/question/creating-a-report-with-multiple-day-intervals


SELECT HD_QUEUE.NAME as 'Queue', 
-- 0 to 14 days
(SELECT count(ID) FROM HD_TICKET
WHERE HD_QUEUE_ID = HD_QUEUE.ID
and HD_TICKET.CREATED BETWEEN DATE_SUB(NOW(), INTERVAL 14 DAY) and NOW()
and HD_TICKET.TIME_CLOSED = '0000-00-00 00:00:00'

) as '0-14',
-- 15 to 29
(SELECT count(HD_TICKET.ID) FROM HD_TICKET
WHERE HD_QUEUE_ID = HD_QUEUE.ID
and HD_TICKET.CREATED BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) and DATE_SUB(NOW(), INTERVAL 15 DAY)
and HD_TICKET.TIME_CLOSED = '0000-00-00 00:00:00'

) as '15-29',
-- 30 to 60
(SELECT count(HD_TICKET.ID) FROM HD_TICKET
WHERE HD_QUEUE_ID = HD_QUEUE.ID
and HD_TICKET.CREATED BETWEEN DATE_SUB(NOW(), INTERVAL 60 DAY) and DATE_SUB(NOW(), INTERVAL 30 DAY)
and HD_TICKET.TIME_CLOSED = '0000-00-00 00:00:00'

) as '30-60'

from HD_QUEUE

where HD_QUEUE.ID in (2,3,4,10,12)                    /*add queue numbers here*/

ORDER BY HD_QUEUE.NAME


