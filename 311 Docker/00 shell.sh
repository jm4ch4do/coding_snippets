# ---------------------------------------- SHELL ----------------------------------------
netstat -ntlp                  # shows port bindings
which nginx                    # where nginx is installed
/etc/init.d/nginx stop         # stops process

ps -p 1 -o comm=               # show process with PID=1
systemctl restart docker       # restarts docker daemon
df -h                          # see space per disk

top                            # show cpu consumption per process
top -i                         # same but hides idle processes

curl localhost:8080/           # test web response

apt-get install dnsutils       # get ip from a name
dig geekforgeeks.org