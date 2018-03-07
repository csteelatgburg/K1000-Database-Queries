--We have a label hierarchy for lab systems of "Labs and Classrooms, Building, Lab"
--Report shows each computer that is assigned a label in that hierarchy
--Used in conjunction with other reports to identify lab machines and where they are 
SELECT M.NAME as COMPUTER, LAB.NAME as LAB, BUILDING.NAME as BUILDING
FROM MACHINE M
JOIN MACHINE_LABEL_JT ML_JT on ML_JT.MACHINE_ID = M.ID
JOIN LABEL LAB ON LAB.ID = ML_JT.LABEL_ID
JOIN LABEL_LABEL_JT BUILDING_JT on LAB.ID = BUILDING_JT.CHILD_LABEL_ID
JOIN LABEL BUILDING on BUILDING.ID = BUILDING_JT.LABEL_ID
JOIN LABEL_LABEL_JT LABS_JT on BUILDING.ID = LABS_JT.CHILD_LABEL_ID

WHERE LABS_JT.LABEL_ID = 271
