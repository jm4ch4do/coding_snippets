# medir % demora de escritura en disco(debian)
apt-get install sysstat
iostat -c | head -4 | tail -1 | awk '{print $4}' 
	      # cuatro primeras líneas
					# toma la última
							  # 4 campo 
UserParameter=io.delay,iostat -c | head -4 | tail -1 | awk '{print $4}' 

" --------------- PARAMETROS DEFINIDOS POR EL USUARIO -------------- "
nano /etc/zabbix/zabbix_agentd.conf
// buscar línea "user-defined"

############ PARAMETROS ADMIN EICMA HAB #################

# -------------------- General -------------------- #

# Memoria total, libre y libre en porciento
UserParameter=mem.total,free -m | grep Mem | awk '{print $2 / 1024.0}' 
UserParameter=mem.free,free -m | grep Mem | awk '{print ($2 - $3) / 1024.0}' 
UserParameter=mem.per,free -m | grep Mem | awk '{print ($2 - $3)/$2 * 100.0}' 

# Swap total, libre y libre en porciento
UserParameter=swap.total,free -m | grep Swap | awk '{print $2 / 1024.0}' 
UserParameter=swap.free,free -m | grep Swap | awk '{print $4 / 1024.0}' 
UserParameter=swap.per,free -m | grep Swap | awk '{print $4/$2 * 100.0}'

# -------------------- General (Freebsd) -------------------- #

# Memoria total, libre y libre en porciento
UserParameter=mem.total,freecolor -mo | grep Mem | awk '{print $2 / 1024.0}' 
UserParameter=mem.free,freecolor -mo | grep Mem | awk '{print ($2 - $3) / 1024.0}' 
UserParameter=mem.per,freecolor -mo | grep Mem | awk '{print ($2 - $3)/$2 * 100.0}' 

# Swap total, libre y libre en porciento
UserParameter=swap.total,freecolor -mo | grep Swap | awk '{print $2 / 1024.0}' 
UserParameter=swap.free,freecolor -mo -m | grep Swap | awk '{print $4 / 1024.0}' 
UserParameter=swap.per,freecolor -mo -m | grep Swap | awk '{print $4/$2 * 100.0}'

# ---------- Correo ---------- #
# Cola de Correo
UserParameter=mail.queue,mailq | grep Requests | cut -f 5 -d ' ' 

# OTRA FORMA DE HACER LO MISMO
UserParameter=mem.total,free -m | grep Mem | sed 's/  */ /g' | cut -f 2 -d ' ' 
UserParameter=mem.free,free -m | grep Mem | sed 's/  */ /g' | cut -f 4 -d ' ' 

UserParameter=swap.total,free -m | grep Swap | sed 's/  */ /g' | cut -f 2 -d ' ' 
UserParameter=swap.free,free -m | grep Swap | sed 's/  */ /g' | cut -f 4 -d ' '

# ---------- Red Proxmox ----------#
vnstat -l | grep rx 
awk '{print $2}'


" -------------------- SI ESTÁ EN MASK -------------------- "
systemctl unmask zabbix-agent.service


service zabbix-agent restart



" -------------------- AGENTE CONF. -------------------- "
" --- INSTALAR AGENTE ZABBIX OFFLINE --- "
# descargar agente de:
http://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix/zabbix-agent_4.0.0-2+stretch_amd64.deb

# descargar dependencia 
http://ftp.br.debian.org/debian/pool/main/c/curl/libcurl3_7.52.1-5+deb9u6_amd64.deb

dpkg -i libcurl3_7.52.1-5+deb9u6_amd64.deb
dpkg -i zabbix-agent_4.0.0-2+stretch_amd64.deb

// --------- INSTALAR AGENTE ZABBIX ONLINE
// debian 9
wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-2+stretch_all.deb
// debian 8
wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-2+jessie_all.deb

apt install zabbix-agent // también puedes usar dpkg -i zabbix-release_4.0-2+jessie_all.deb para instalar desde local
service zabbix-agent start // iniciar agente



nano /etc/zabbix/zabbix_agentd.conf
 	Server=10.1.0.91 // (ip of the zabbix server, si hay NAT debe ser la del NAT)
 	ServerActive=10.1.0.91 // (ip of the zabbix server, si hay NAT debe ser la del NAT)

service zabbix-agent start

// ---------- CONFIGURAR AGENTE COMO ACTIVO

nano /etc/zabbix/zabbix_agentd.conf
	EnableRemoteCommands=1 // recibe comandos del servidor
	DebugLevel=3
	LogRemoteCommands=1
	ListenPort=10050
	#Hostname=Zabbix Server

service zabbix-agent restart

netstat -lnp | grep zabbix // comprobar que el agente está escuchando

--------------- INSTALL ----------
// Install Repository with MySQL database
wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-2+stretch_all.deb
dpkg -i zabbix-release_4.0-2+stretch_all.deb
	

// Install Zabbix server, frontend, agent
apt install zabbix-server-mysql zabbix-frontend-php zabbix-agent

// Create initial database
mysql -uroot -p

	create database zabbix character set utf8 collate utf8_bin;
	grant all privileges on zabbix.* to zabbix@localhost identified by 'password';
	quit;

// Import initial schema and data. You will be prompted to enter your newly created password.
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix

// Configure the database for Zabbix server (hay que escribirlo en los dos lugares que aparece)
nano /etc/zabbix/zabbix_server.conf
	DBPassword=password

// Configure PHP for Zabbix frontend
nano /etc/zabbix/apache.conf 
//uncomment and set the right timezone for you (la de nosotros es America/Detroit)
php_value date.timezone Europe/Riga

// Start Zabbix server and agent processes
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2

//entra por la web a 
http://10.1.0.91/zabbix/setup.php

// usar password por defecto 
Admin zabbix

// la configuración se guarda en:
/usr/share/zabbix/conf/zabbix.conf.php


