-- Report to find computers in two IP ranges that have a static IP address defined
-- Good example of the INET_ATON function
SELECT MACHINE.ID, NAME, MACHINE.MAC, MACHINE.IP, DHCP_ENABLED, LAST_INVENTORY, OS_NAME, CS_MODEL 
FROM ORG1.MACHINE
JOIN MACHINE_NICS on MACHINE_NICS.ID = MACHINE.ID AND MACHINE_NICS.IP = MACHINE.IP
WHERE INET_ATON(MACHINE.IP) between INET_ATON("172.16.24.1") and INET_ATON("172.16.39.255")

AND DHCP_ENABLED = "FALSE"
ORDER BY INET_ATON(MACHINE.IP);
