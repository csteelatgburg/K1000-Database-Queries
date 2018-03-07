--Instructor computer names end in -inst
--Report identifies instructor computers not in our two lab VLANs
--Also, one computer is named for the user wilkinst, ignore that one
SELECT ID, NAME, MAC, IP, LAST_INVENTORY, OS_NAME, CS_MODEL 
FROM ORG1.MACHINE
WHERE NAME like "%inst"
and (INET_ATON(IP) not between INET_ATON("172.16.16.1") and INET_ATON("172.16.23.255")
and INET_ATON(IP) not between INET_ATON("172.16.96.1") and INET_ATON("172.16.101.255"))
and NAME != "wilkinst"
ORDER BY NAME
