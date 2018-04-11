-- Report of computers in our patch production schedule (patch-ORG1-3)
-- Includes columns for patching phase, number of patches installed
-- number of patches not installed and last patch scheduled run 
SELECT M.ID as Machine_ID, M.NAME AS Machine, M.KUID
, K.PHASE AS Phase, K.TYPE
, PSMS.PATCHED, PSMS.NOTPATCHED
, P.DESCRIPTION AS Description, P.LAST_RUN AS LAST_RUN
FROM MACHINE M
LEFT JOIN KBSYS.KONDUCTOR_TASK K ON K.KUID = M.KUID
LEFT JOIN PATCHLINK_SCHEDULE_MACHINE_STATUS PSMS ON PSMS.MACHINE_ID = M.ID
LEFT JOIN PATCHLINK_SCHEDULE P ON P.ID = PSMS.PATCHLINK_SCHEDULE_ID
WHERE K.TYPE = 'patch-ORG1-3'
GROUP BY M.NAME
ORDER BY M.NAME
