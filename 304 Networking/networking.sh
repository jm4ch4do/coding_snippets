" -------------------------------- TRÁFICO --------------------------------- "
vnstat -l # muestra tráfico en tiempo real
vnstat --iflist # interfaces disponibles y la velocidad de cada una


" ---------------------------------- IP ------------------------------------ "
ip -br a # descripción breve ip
ip a # descripción ampliada ip

ip route show # ver ip y gateway
netstat -r # gateway
nano /etc/network/interfaces # ver ip y gateway 

arp -r # busca ip y mac de la red local
ip route # routing table

# reiniciar las interfaces de red
/etc/init.d/networking restart


" -------------------------------- TCPDUMP --------------------------------- "
# visualizar paquetes que pasan por una interfaz
tcpdump udp port 53 | grep 172.16.106.0 # visualiza el tráfico por el puerto 53 y la ip 172.16.106.0
tcpdump -i any icmp # escuchar tráfico icmp por cualquier interfaz
tcpdump -vi any port 10050 # para ver zabbix
tcpdump -i any port 10050 | grep 10.2.0.2


# poner dirección ip en debian
nano /etc/network/interfaces
iface enp0s3 inet static # stactic = dirección estática
address 10.10.10.21
netmask 255.255.255.0
gateway 10.10.10.1
/etc/init.d/networking restart # reiniciar las interfaces
ifup enp0s3 # levanta la interfaz


" -------------------------------- WINDOWS --------------------------------- "

ipconfig # ver ips
route print # ver rutas
route ADD -p 10.10.10.0 MASK 255.255.255.0 10.1.0.50 # agregar la ruta: para llegar a 10.10.10.0/24 hay que enviar por 10.1.0.50
                                                     # -p es para que sea persistente (no se borra luego del reinicio)

" -------------------------------- LINUX --------------------------------- "
route add -net 192.168.52.0 netmask 255.255.255.0 gw 192.168.50.10
