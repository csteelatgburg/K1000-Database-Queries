SELECT ID,
STR_TO_DATE(substring_index(substring_index(STR_FIELD_VALUE, '<br/>', 1), ': ', -1), '%m/%d/%Y') as WARRANTY,
STR_TO_DATE(substring_index(substring_index(STR_FIELD_VALUE, '<br/>', 2), ': ', -1), '%m/%d/%Y') as PURCHASE,

STR_FIELD_VALUE
FROM ORG1.MACHINE_CUSTOM_INVENTORY WHERE SOFTWARE_ID = 86831
HAVING WARRANTY < NOW()