--This query is specific to a custom asset type that tracks classroom assets
--It is designed to output in a format that can be imported into our Banner system
SELECT  ASSET.NAME,
BUILDING.NAME as "Building",
BUILDINGDATA.FIELD_152 as "Building Code",
AD.FIELD_46 as 'Room Number',
IF(AD.FIELD_48="Windows", "Yes", "No") as "SMIP",
IF(AD.FIELD_48="MacOS", "Yes", "No") as "SMIM",
IF(AD.FIELD_48="Dual Boot", "Yes", "No") as "SMID",
IF(AD.FIELD_49 = "Windows", "Yes", "No") as "PC",
IF(AD.FIELD_49 = "MacOS", "Yes", "No") as "MAC",
IF(AD.FIELD_49 = "Dual Boot", "Yes", "No") as "DBCO",
IF(AD.FIELD_71 = "Yes", "Yes", "No") as 'MRDV',
IF(AD.FIELD_10009 = "VGA", "Yes", "No") as 'LAPC',
IF(AD.FIELD_10009 = "HDMI", "Yes", "No") as 'LAPH',
IF(AD.FIELD_10009 = "Both", "Yes", "No") as 'LAPB',
IF(AD.FIELD_10008 = "Yes", "Yes", "No") as 'INET',
IF(AD.FIELD_10011 = "Yes", "Yes", "No") as 'WCR',
IF(AD.FIELD_10008 = "Requires Mic", "Yes", "No") as 'WCRM',
IF(AD.FIELD_10010 = "Yes", "Yes", "No") as 'AUX',
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Media Controller%", "Yes", "No") as "MEDC",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%DVD/VCR%", "Yes", "No") as "DVD",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Projector%", "Yes", "No") as "DATP",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Overhead projector%", "Yes", "No") as "OVHP",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Slide Projector%", "Yes", "No") as "SLDP",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%TV%", "Yes", "No") as "TV",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%PAL VCR%", "Yes", "No") as "VCR",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Document Camera%", "Yes", "No") as "DOCM",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Smart Podium%", "Yes", "No") as "SMPO",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Presentation Remote%", "Yes", "No") as "PRRM",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Switcher%", "Yes", "No") as "SWCH",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%IRCM%", "Yes", "No") as "IRCM",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%MPA%", "Yes", "No") as "MPA",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Speaker%", "Yes", "No") as "SPKR",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Video Camera%", "Yes", "No") as "VDCM",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Keyboard%", "Yes", "No") as "KYBD",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Turntable%", "Yes", "No") as "TRTB",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Mixer%", "Yes", "No") as "MIXR",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Smart Board%", "Yes", "No") as "SMBR",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Blu-ray player%", "Yes", "No") as "BLUR",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Web cam%", "Yes", "No") as "WCAM",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Lecture Capture%", "Yes", "No") as "LCAP",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%Conference Phone%", "Yes", "No") as "CONP",
IF(GROUP_CONCAT(AA_DATA.FIELD_64) LIKE "%DVD Player%", "Yes", "No") as "DVDP",

ASSET.MODIFIED
FROM ASSET
LEFT JOIN ASSET_DATA_9 AD ON AD.ID = ASSET.ASSET_DATA_ID
LEFT JOIN ASSET_ASSOCIATION BUILDINGA ON BUILDINGA.ASSET_FIELD_ID = 45 AND BUILDINGA.ASSET_ID = ASSET.ID
LEFT JOIN ASSET BUILDING ON BUILDING.ID = BUILDINGA.ASSOCIATED_ASSET_ID
LEFT JOIN ASSET_DATA_1 BUILDINGDATA ON BUILDING.ASSET_DATA_ID = BUILDINGDATA.ID
LEFT JOIN ASSET_ASSOCIATION J1 on J1.ASSET_FIELD_ID = 77 AND J1.ASSOCIATED_ASSET_ID = ASSET.ID
LEFT JOIN ASSET AA ON AA.ID = J1.ASSET_ID
LEFT JOIN ASSET_DATA_10 AA_DATA ON AA.ASSET_DATA_ID = AA_DATA.ID
where ASSET.ASSET_TYPE_ID = 9
GROUP BY ASSET.ID
ORDER BY ASSET.NAME
