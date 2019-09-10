-- computer uptime broken down to minutes


SELECT ID, NAME, UPTIME, 
left(UPTIME, locate(',', UPTIME) -1) AS DAYS,
substring_index(substring(UPTIME, locate(',', UPTIME) +1), ':', 1) as HOURS,
substring_index(UPTIME, ':', -1) as MINUTES,
(((left(UPTIME, locate(',', UPTIME) -1) * 24) + substring_index(substring(UPTIME, locate(',', UPTIME) +1), ':', 1)) * 60) + substring_index(UPTIME, ':', -1) AS 'Uptime in Minutes'
 FROM ORG1.MACHINE
 WHERE (((left(UPTIME, locate(',', UPTIME) -1) * 24) + substring_index(substring(UPTIME, locate(',', UPTIME) +1), ':', 1)) * 60) + substring_index(UPTIME, ':', -1) < 120