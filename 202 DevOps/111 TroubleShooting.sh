"------------------------TROUBLE SHOOTING-------------------------"
# Verify if any process is using port 80
netstat -aon | findstr :80

# view running processes
ps fax 

# also shows process but doesn't show ports
ps

# test web response
curl localhost:8080/

# get ip from a name
apt-get install dnsutils
dig geekforgeeks.org












