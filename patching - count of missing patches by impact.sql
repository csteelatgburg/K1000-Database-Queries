-- Report showing number of critical and recommended patches missing on computers
-- Submitted as answer to https://www.itninja.com/question/custom-sql-report-computers-w-user-missing-more-than-x-number-of-critical-amp-recommended-patches-showing-calculated-values-for-those-criteria-and-sorted-by-total-missing-patches

SELECT M.NAME, 
SUM(P.IMPACTID = 'Critical') AS 'Critical', 
SUM(P.IMPACTID = 'Recommended') as 'Recommended',
COUNT(P.IMPACTID) as 'Total'
-- for debugging uncomment these lines
-- , GROUP_CONCAT(CASE WHEN P.IMPACTID = 'Critical' THEN PP.TITLE END) AS 'Critical Patches'
-- , GROUP_CONCAT(CASE WHEN P.IMPACTID = 'Recommended' THEN PP.TITLE END) AS 'Recommended Patches'
-- end debugging lines
FROM ORG1.PATCHLINK_MACHINE_STATUS PMS
JOIN KBSYS.PATCHLINK_PATCH P on P.UID = PMS.PATCHUID 
JOIN MACHINE M on M.ID = PMS.MACHINE_ID
JOIN KBSYS.PATCHLINK_PATCH PP on PP.UID = PMS.PATCHUID
JOIN PATCHLINK_PATCH_STATUS PPS ON (PPS.PATCHUID = PP.UID)
WHERE PMS.STATUS = "NOTPATCHED"
and PP.IS_SUPERCEDED = 0
and PPS.STATUS = 0
GROUP BY M.NAME