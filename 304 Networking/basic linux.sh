" ------------------------- INSTALAR SOFT ------------------------- "
dpkg --list | grep zabbix # ver si zabbix está en los programas instalados
apt-get --purge remove zabbix-agent # remove completamente zabbix

apt-cache search jdk | more  # buscar en el repositorio paquetes con el nombre jdk
apt-cache show openjdk-7-jre  # ver características del paquete

apt-get -o Acquire::Check-Valid-Until=false update  # actualiza ignorando que la fecha haya expirado

apt install mc htop deborphan  # mc: midnigth commander, htop, deborphan: eliminate bad paquets
orphaner

apt-get install aptitude  # package handler
aptitude install -f
aptitude purge
aptitude clean
aptitude autoclean
apt-get autoclean

sudo aptitude search bind9
aptitude show bind9
aptitude search dns | grep utils

" ------------------------- EXPORTAR PROXY ------------------------ "
export http_proxy="http://172.16.64.128:3128"

" ------------------------- CAMBIAR FECHA ------------------------- "
date -s "13 NOV 2018 11:20:00" # cambio manual
dpkg-reconfigure tzdata # cambio asistido

" ----------------------------- BÁSICO ---------------------------- "
uptime # tiempo que lleva corriendo el sistema
uname -mrs # ver sistema operativo en freebsd
cat etc/os-release # ver sistema operativo debian moderno
cat etc/issue  # ver sistema operativo debian viejo
/etc/init.d/   # servicios funcionando
service --status-all # este es mejor para ver servicios funcionando

" ------------------------- ACCESO REMOTO ------------------------- "
nano /etc/ssh/sshd_config # para habilitar acceso con root por ssh
 	AllowUsers root jose adrian 
service ssh restart

# ROOT
sudo passwd root # cambiar password root
nano /etc/ssh/sshd_config # habilitar root por ssh
	PermitRootLogin yes
/etc/init.d/ssh restart

" ------------------------ USUARIOS DEBIAN ------------------------ "
w jose  # consumo del usuario jose
cat /etc/passwd # lista de usuarios

# GRUPOS
groups jose  # ver en que grupos está jose -
usermod -a -G proxy jose # agregar al usuario jose al grupo proxy
usermod -aG sudo sammy # agregar el usuario sammy al grupo de los sudoers (toma permisos de administrador)

# CREAR/ELIMINAR
sudo adduser new_username # crear usuario
sudo userdel username # eliminar usuario
sudo rm -r /home/username # eliminar el directorio del usuario
deluser --remove-home sammy # eliminar a la vez el usuario y su directorio

# MODIFICAR
usermod -l new_username old_username # modificar nombre de usuario
sudo passwd username # cambiar password

" --------------------------- PROCESOS ---------------------------- "
ps  # procesos que corre mi shell activa
ps -ef  # procesos que corre el sistema en general


ps -Al # lista detallada
ps -auxf | sort -nr -k 4 | head -10 # 10 procesos que más consumen memoria.
ps -auxf | sort -nr -k 3 | head -10 # procesos que más consumen cpu

pgrep python  # find all process run by python
pkill python  # delete all process run by python

" ----------------- MEMORIA, MICRO, DISCO DURO -------------------- "
free -h # ver consumo de memoria
top
	mayus + M # procesos ordenados por memoria

ipcs -mp # ver uso de swap
ipcs -m
ipcs -mt

df -h # ver espacio consumido
du -h /home/tecmint # muestra el espacio consumido en disco duro en la carpeta "/home/tecmint"
df -a # incluyendo archivos que están dentro
du -h --max-depth=1 # va a una sola carpeta de profundidad

saidar  # ver consumo de recursos

" ---------------------- MIDNIGTH COMMNADER ----------------------- "
apt-get install mc # install midnigth commander
mc # ejecutar midnight commander
crtl + z # salir del midnight commander

" -------------------------- SNMP CLIENT -------------------------- "
apt-get install snmp snmpd # install snmp client
snmpstatus # verificar si snmp está instalado
nano /etc/snmp/snmpd.conf #editar configuración snmp
rocommunity Str0ngC0mmunity # esto se pone dentro del archivo para especificar nombre del permiso y community string

" -------------------------- SIMPLE TRICKS ------------------------- "
who am i # da el usuario logeado
cal # desliega calendario
cal 7 2006 # despliega calendario mes 7 2016
pwd # ver folder actual


