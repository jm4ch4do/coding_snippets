" ------------------- DESHABILITAR -------------------- "
/etc/init.d/iptables stop
/etc/init.d/ssh start // habilitar ssh

"----------" 
# en el archivo 
nano /etc/network/interfaces
# se agrega la línea
post-up iptables-restore < /etc/network/iptables.up.rules # indica leer este archivo cada vez que reinicie interfaz
# por tanto el siguiente archivo tiene las reglas iptables
nano /etc/network/iptables.up.rules

---------- VER TABLAS ----------
iptables -vnL // displays filters table
iptables -t mangles -vnL // displays mangle table
iptables -t nat -vnL // displays nat table
iptables -L -n -v --line-numbers // ver reglas en detalle



---------- POLÍTICAS POR DEFECTO ----------
iptables -F // borra todas las reglas

// aceptar todo
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT

iptables -P INPUT DROP // descarta tráfico entrante por defecto (POLITICA por defecto de INPUT a DROP)


---------- PERMITIR CONEXIONES DE IPS ESPECÍFICAS ----------
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT // ( APPEND a INPUT la SOURCE que sea 192.168.1.0/24 JUMP a ACCEPT )

---------- PERMITIR CONEXIONES PUERTOS ESPECÍFICOS ----------
iptables -A INPUT -p tcp --dport 5160 -j ACCEPT // (APPEND a INPUT el PROTOCOLO tcp PUERTO 5160 JUMP a ACCEPT)

---------- BORRAR REGLAS ----------
iptables -D INPUT 3 // (DELETE en INPUT la regla 3) (es necesario primero hacer iptables -vnL para ver cual es la regla 3 de INPUT)

---------- RANGO DE IPS ----------



iprange --src-range 10.13.13.10-10.13.13.19





---------- USEFUL EXAMPLES ----------
// Aceptar Trafico del zabbix4
-A INPUT -p tcp -m tcp -s 172.16.64.91/32 --dport 10050 -j ACCEPT


iptables -A INPUT -i lo -j ACCEPT // acepta todo lo que entre por la interfaz del localhost
iptables -A OUTPUT -o lo -j ACCEPT // acepta todo lo que entre por la interfaz del localhost

iptables -A FORWARD -p icmp -d 172.16.64.0/24 -i eth2 -j ACCEPT // permitir pasar el ping desde la interfaz eth2 hacia la red 172.16.64.0

SERVER_IP = "192.168.0.3" // carga la dirección en una variable
iptables -I INPUT -i eth0 -p tcp -s 0/0 -d $SERVER_IP --dport 21 -j DROP 
// la primera regla de INPUT será que los paquetes entrantes por la INTERFAZ ETHO del PROTOCOLO TCP con SOURCE cualquiera con DESTINO a $SERVER_IP con PUERTO DESTINO 21
// - I indica colocar como primera regla
// - I 4 indica colocar como regla número 4
// si no se pone el -s se entiende que es para cualquiera


--------- MODIFICAR PERMANENTE ----------

nano /etc/network/iptables.up.rules (CTRL+O) (enter)
iptables-restore < /etc/network/iptables.up.rules





---------- EJEMPLO DE CONFIGURACIÓN CLÁSICA DE UNA ESTACIÓN -----------
// Evitar bloquearse uno mismo
MI_IP = "192.168.0.3" // carga la dirección en una variable
iptables -a INPUT -p tcp --dport 22 -s MI_IP -j ACCEPT  

// Aceptar cualquier conexión relacionada o establecida
-I INPUT l -m state --state RELATED, ESTABLISHED -j ACCEPT
-I OUTPUT l -m state --state RELATED, ESTABLISHED -j ACCEPT

// Permitir cualquier tráfico en la interfaz loopback
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

// Permitir tráfico de salida de peticiones DHCP
// (la repuesta DCHP ya entra pues es una conexión relacionada)
-A OUTPUT -o eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

// Permitir conexiones SSH de entrada
// (La respuesta ya funciona porque es conexión relacionada)
-A INPUT -i eth0 -p tcp -m tcp --dport 22 state --state NEW -j ACCEPT

// Permitir correo de salida
-A INPUT -i eth0 -p tcp -m tcp --dport 25 -m state --state NEW -j ACCEPT

// Permitir DNS de salida
-A OUTPUT -o eth0 -p udp -m udp --dport 53 -j ACCEPT

// Permitir peticiones de ping
-A OUTPUT -o eth0 -p icmp -j ACCEPT

// Permitir NTP de salida (Network Time Protocol)
-A OUTPUT -o eth0 -p udp --dport 123 --sport 123 -j ACCEPT

// Salida HTTP
-A OUTPUT -o eth0 -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A OUTPUT -o eth0 -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT

// Permitir Facebook al mediodía
-A OUTPUT -p tcp -m multiport -dport http,https -i eth0 -o eth1 -m time --timestart 12:00 --timestop 13:00 -d 31.13.64.0/18 -j ACCEPT

// Cancelar todo el trafico en la madrugada (horario de mantenimiento)
-A INPUT -p tcp -m time --timestart 02:00 --timestop 03:0 -j DROP
-A INPUT -p udp -m time --timestart 02:00 --timestop 03:0 -j DROP 

// Para evitar el ataque de denegación de servicios se permiten 20 conexiones por IP
-A INPUT -p tcp -syn -m multiplort --dport 80,443 -m connlimit --connlimit-above 20 -j REJECT --reject-with-tcp-reset
// También se puede limitar la cantidad de conexiones que puede hacer una IP en un período de tiempo
-A INPUT -p tcp -m multiport --dport 80,443 -m state --state NEW -m recent --set // hace una marca para recordar el momento en que llegó la petición de la IP
-A INPUT -p tcp -m multiport --dport 80,443 -m state --state NEW -m recent --update --seconds 100 -hitcount 10 -j DROP //si la IP tiene más de 10 conexiones en 100 segundos hará DROP

// Monitoring IP-TABLES
watch --interval=5 'iptables -nvL | grep -v "0     0"'





------------------------------- EJEMPLO CONFIGURACIÓN SUITE.MINAG.GOB.CU ------------------------------------
--------------------------------------------------------------------------------------------------------------------------
# suite.minag.gob.cu
# ------------------------- REGLAS ESPECIFICAS -------------------------

# ----- permitir acceso desde la UEB Habana
# sin pasar por el fwedificio
-A INPUT -s 172.16.124.120/32 -p tcp -m tcp --dport 22 -j ACCEPT
# pasando por el fwedificio 
-A INPUT -s 192.168.253.180/32 -p tcp -m tcp --dport 22 -j ACCEPT 

# ----- permitir acceso desde el firewall interno
# puerto granja interna 
-A INPUT -s 172.16.64.254/32 -p tcp -m tcp --dport 22 -j ACCEPT 
# puerto DMZ
-A INPUT -s 192.168.50.210/32 -p tcp -m tcp --dport 22 -j ACCEPT 
# ping desde el puerto de la granja interna
-A INPUT -p icmp -s 172.16.64.254 -j ACCEPT 
# ping desde el puerto de la DMZ
-A INPUT -p icmp -s 192.168.50.210 -j ACCEPT 
# postgres desde puerto granja interna
-A INPUT -p tcp -m tcp -s 172.16.64.254/32 --dport 5432 -j ACCEPT 
# postgres desde puerto granja interna
-A INPUT -p tcp -m tcp -s 172.16.64.254/32 --dport 5439 -j ACCEPT 

# abrir puertos desconocidos al firewall interno ???????????
-A INPUT -p tcp -m tcp -s 172.16.64.254/32 --dport 35621 -j ACCEPT
-A INPUT -p tcp -m tcp -s 192.168.50.210/32 --dport 35621 -j ACCEPT
-A INPUT -p udp -m udp -s 172.16.64.254/32 --dport 35622 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.50.210/32 --dport 35622 -j ACCEPT
-A INPUT -p tcp -m tcp -s 172.16.64.254/32 --dport 35623 -j ACCEPT
-A INPUT -p tcp -m tcp -s 192.168.50.210/32 --dport 35623 -j ACCEPT

# abrir gran cantidad de puertos ??????????
-A INPUT -p tcp -m tcp --dport 1024:65535 -j ACCEPT

# ------------------------- REGLAS GENERALES ------------------------

# permitir conexiones establecidas
-I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-I OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# permitir trafico de la interfack loopback
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# permitir SSH de entrada
-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT

# permitir correo de salida
-A OUTPUT -p tcp -m tcp --dport 25 -m state --state NEW -j ACCEPT

# permitir DNS de salida
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT

# permitir acceso FTP
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

# permitir PING de entrada y salida
-A OUTPUT -p icmp --icmp-type 8 -j ACCEPT
-A INPUT -p icmp --icmp-type 8 -j ACCEPT

# permitir entrada a postgres para consultar
-A INPUT -p tcp -m tcp --dport 5432 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 5439 -j ACCEPT

# permitir HTTP de entrada
-A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT

# permitir envío de informacion al OSSIM
-A OUTPUT -d 172.16.64.172 -m udp -p udp --dport 1514 -j ACCEPT

# postgres desde puerto granja interna
-A INPUT -p tcp -m tcp --dport 5432 -j ACCEPT 
# postgres desde puerto granja interna
-A INPUT -p tcp -m tcp --dport 5439 -j ACCEPT





