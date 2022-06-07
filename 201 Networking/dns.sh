" ------------------------------ INSTALL ------------------------------ "
nano /etc/apt/sources.list # actualiza la lista de repositorios (dejar solo lo siguiente)
	deb http://mirror.eicma.cu/debian strech main contrib
	deb http://mirror.eicma.cu/debian stretch-updates main contrib

nano /etc/resolv.conf # agregar aquí los resolvers dns

apt-get update # actualizar repositorio


# aquí dice donde se guardan las direcciones de la sectorial y la granja interna
nano /etc/bind/named.conf.local

# reiniciar bind
service bind9 restart

# reiniciar servicios
rndc reload


" ---------------------------- CHECK ERRORS --------------------------- "
named-checkconf -z | grep error # check errors in zones
named-checkconf -zp

# check error in a specific zone
named-checkzone acpa.hlg.minag.cu /etc/bind/sectorial/db.acpa.hlg.minag.cu.sectorial


" --------------- CREAR NUEVO REGISTRO EN DNS INTERNO 1 --------------- "
nslookup acopio.vcl.minag.cu # chequear si el dns responde al dominio 

nano /etc/bind/named.conf.local # aquí están todos los dominios, si son master o slave, y donde está su info
	(crtl+w) # buscar dominio
	# si no existe copiar otro que sea master y modificar la línea que dice file para un nuevo archivo

cp /etc/bind/sectorial/db.ccg.may.minag.cu.sectorial /etc/bind/sectorial/db.acopio.vcl.minag.cu.sectorial # copiar la info de otro dominio (desde otro hacia el nuevo)

db.acopio.vcl.minag.cu.sectorial # entrar a modificar los datos del duplicado
	(crtl+w) + (crtl+r) # para buscar y reemplazar los datos del anterior
	# reemplazar la ip (ejemplo 172.18.187.26)
	# reemplazar el dominio (ejemplo acopio.vcl.minag.cu)

service bind9 restart

nslookup acopio.vcl.minag.cu # chequear la nueva respuesta del dns

# probar
nslookup pienso.scu.minag.cu 172.16.64.1	
nslookup pienso.scu.minag.cu 172.16.64.2
nslookup pienso.scu.minag.cu 172.16.64.3

---------- replicarlo al dns interno 2 y 3 ----------
nano /etc/bind/named.conf.local
	(crtl+w) // buscar dominio
	# si no existe copiar otro que sea slave y modificar la línea que dice file para un nuevo archivo
service bind9 restart


---------- ponerlos en dnsext 1 ----------
nano /etc/bind/external/db.minag.cu.external
	(crtl+w) # buscar dominio similar (ejemplo para pienso.scu.minag.cu buscar .scu)
	# copiar y modificar, aquí solo dice pienso.scu y no está lo de atrás

service bind9 restart

# probar
nslookup pienso.scu.minag.cu 192.168.50.216
nslookup pienso.scu.minag.cu 192.168.50.215
nslookup pienso.scu.minag.cu 192.168.50.214

" ////////////////////////////////////////////// "


" -------------------- ZONA INVERSA SECTORIAL 64 -------------------- "
nano /etc/bind/sectorial/db.eicma.gi.cu.reverse.sectorial

" --------------------------- PONER SLAVE --------------------------- "
# copiar otro slave y cambiar ip en dnsint1
telnet ip_nueva 53 # para ver si está activo el master
named-checkconf # ver si está bien la configuración
rndc reload # para que cree el archivo nuevo encriptado (ejemplo: db.db.dlgpr.pri.minag.gob.cu.sectorial)


" ---------------------------- DIG, HOST ---------------------------- "
host -a enpa.minag.cu
host -a kcl.ac.uk
host -t NS kcl.ac.uk
host -t SOA kcl.ac.uk
host -a kcl.ac.uk
host kcl.ac.uk
host -a 137.73.130.1356
host -a 137.73.130.135
host -t TXT kcl.ac.uk
host -t SRV  kcl.ac.uk
host -a eicma.cu
host -a eicma.cu
host -t mx eicma.cu
host -t A eicma.cu
host -t AAAA eicma.cu
host -t PTR  eicma.cu
host -t ns  eicma.cu
dig eicma.cu
man dig
host -t ns  eicma.cu 172.16.64.3
host -a minag.cu 8.8.8.8
host -t ns bohemia.cu

" ------------------------- SEE DNS TRAFFIC ------------------------- "
apt-get install dnstop

# ver tráfico en tiempo real
dnstop ens192  

# guardar tráfico en archivo y luego procesar
tcpdump -w /home/jose/dump.pcap -c 2000 port 53 # tomar 2000 paquetes
dnstop /home/jose/dump.pcap > /home/jose/savefile.txt
cat /home/jose/savefile.txt


" ----------------------------- CONCEPTS ---------------------------- "
query -> hacer una consulta
delegate -> dejar a otros administrar
DNS - Domain Name System

