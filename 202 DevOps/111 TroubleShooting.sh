"------------------------TROUBLE SHOOTING-------------------------"
# Verify if any process is using port 80
netstat -aon | findstr :80

ps fax  # view running processes
ps  # also shows process but doesn't show ports
top  # show cpu consumption per process
top -i  # same but hides idle processes

# test web response
curl localhost:8080/

# get ip from a name
apt-get install dnsutils
dig geekforgeeks.org













