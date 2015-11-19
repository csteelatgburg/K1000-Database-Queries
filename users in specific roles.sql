SELECT * FROM ORG1.USER 
WHERE ROLE_ID in (1, 5, 6, 8, 13, 14)
and EMAIL like "%@dickinson.edu"
ORDER BY EMAIL