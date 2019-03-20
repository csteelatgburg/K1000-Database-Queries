-- Patches per computer patched and not patched
-- includes count and titles of patches
-- Poasted as solution for https://www.itninja.com/question/patch-report-request


Select M.NAME as MACHINE_NAME, SUM(MS.STATUS='PATCHED') AS PATCHED, 
SUM(MS.STATUS='NOTPATCHED') AS NOT_PATCHED,
GROUP_CONCAT(CASE WHEN MS.STATUS = 'PATCHED' THEN PP.TITLE END) AS 'Titles Patched',
GROUP_CONCAT(CASE WHEN MS.STATUS = 'NOTPATCHED' THEN PP.TITLE END) AS 'Titles Not Patched'

FROM ORG1.PATCHLINK_MACHINE_STATUS MS 
JOIN ORG1.MACHINE M ON M.ID = MS.MACHINE_ID 
JOIN KBSYS.PATCHLINK_PATCH PP ON PP.UID = MS.PATCHUID 
JOIN PATCHLINK_PATCH_STATUS PPS ON PPS.PATCHUID = PP.UID 
where PPS.STATUS = 0 /* 0=active patches */ 
AND VENDOR like "Adobe%" /* Use like % to catch multiple spellings, etc */
group by MACHINE_NAME
order by MACHINE_NAME, PP.TITLE