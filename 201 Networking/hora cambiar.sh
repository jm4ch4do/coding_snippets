mv /etc/localtime /etc/localtime.old
cp /usr/share/zoneinfo/America/Havana /etc/localtime

nano /etc/default/ntpdate
	NTPSERVERS="172.16.110.1"

set date ntp 172.16.110.1

date -s "13 NOV 2018 11:20:00"