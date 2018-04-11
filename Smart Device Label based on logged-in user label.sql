/*
KACE 1000 smart machine lables based on logged in user label
Automatically populates a Device Smart Label by users contained in ore or more User Label(s)
*/
SELECT MACHINE.NAME AS SYSTEM_NAME
FROM MACHINE
JOIN USER ON (USER.USER_NAME = MACHINE.USER)
JOIN USER_LABEL_JT ON (USER_LABEL_JT.USER_ID = USER.ID)
JOIN LABEL ON (LABEL.ID = USER_LABEL_JT.LABEL_ID)
WHERE LABEL.NAME rlike 'user label1|user label2|etc'