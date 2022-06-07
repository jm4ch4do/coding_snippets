# instalar la versión SQL de bacula, marcar los archivos principales en el instalador synaptic package instaler y luego desmarcar pgsql y marcar mysql 

" ------------------ WEBMIN, UBUNTU 18, BACULA -------------------- "
# Hay que instalar libdbd-mysql-perl en ubuntu para que funcione

" ------------------------- BACULA FILES -------------------------- "
vim /etc/bacula/bacula-div.conf # editar archivo de configuración director bacula
vim /etc/bacula/bacula-sd.conf
vim /etc/bacula/bacula-fd.conf


service bacula-sd status # comprueba el estado del storage daemos (servicio de almacenamiento) bacula
service bacula-director status


netstat -anp | grep bacula-fd # muestra las direcciones donde escucha el servicio bacula-fd