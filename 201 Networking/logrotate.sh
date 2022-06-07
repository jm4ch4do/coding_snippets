"---------- MAIN FILE ----------"
# aquí está la configuración general y se indica si hay archivos secundario de configuración.
nano /etc/logrotate.conf

# indica que hay archivos secundarios en esta carpeta
include /etc/logrotate.d

"---------- EJECUTAR LOGROTATE ----------"
# ejecuta 
logrotate -d /etc/logrotate.d/apache2.conf

# ejecutar otra manera
/usr/sbin/logrotate /etc/logrotate.conf #ejecuta log rotate con el archivo .conf

# ejecución automática 
nano /etc/cron.daily/logrotate

"---------- LOGS DE LOG ROTATE ----------"
cat /var/lib/logrotate/status


"---------- CUERPO DEL SCRIPT ----------"
/var/log/zabbix-agent/zabbix_agentd.log { # se va a rotar el archivo /var/..._agentd.log 
# aquí van las opciones
}

/var/log/apache2/*.log { # esto rota todos los archivos que sean extensión .log

"---------- OPCIONES ----------"
# la herramienta intentará rotar los logs diariamente
daily weekly monthly yearly

# guardar 4 archivos de rotaciones y comenzar a borrar el 5to 
se guardarán 4 rotaciones de logs, el resto se borra (4 rotaciones pueden ser 4 días o 4 semanas o 4 meses, ver arriba)
rotate 4

# crear nuevos archivos de logs vacíos luego de rotar los viejos
create
create 0777 root root #se crea con permisos 0777 con propietario root y pertenece al gurpo root

# comprimir los archivos de logs
compress
nocompress # lo contrario

# el último archivo de log no debe estar comprimido
delaycompress

# para que se ejecute la rotación el archivo debe ocupar por lo menos 10M
size=10k	size=10M	size=10G

# no rotar si el log está vacíosn
notifempty

# a los logs por defecto se le pone un número al final. Esta opción les pone una fecha
dateext: 
dateformat -%d%m%Y # variante uno: les pone al final día/mes/año
dateformat -web01-%Y-%m-%d-%s # variante dos: pone al final "-web01-" año/mes/día/segundo

# enviar el log que se va a borrar al correo proporcionado
mail gabriel@mydomain.com

# No dar error si no hay archivo de log
missingok

# No rotar si el archivo está vacío
notifempty

# Run postrotate script after all logs are rotated. If this is not set, it will run postrotate after each matching file is rotated.
sharedscripts

# comando personalizado antes de la rotación
pretrotate
   		echo "A rotation is goint to take place." | mail root
endscript

# comando personalizado luego de la rotación
postrotate
   		echo "A rotation just took place." | mail root
endscript




test ! -x /usr/sbin/sarg-reports || /usr/sbin/sarg-reports daily

! # si la expresión es falsa
-x # el archivo existe y el usuario tiene permiso de ejecución
|| # si es falso ejecutar esto

test ! -e /var/run/squid.pid || test ! -x /usr/sbin/squid || /usr/sbin/squid -k rotate

-e # si el archivo existe
squid -k rotate # indica al squid rotar los archivos