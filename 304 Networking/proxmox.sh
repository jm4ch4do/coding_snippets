"--------------------------------- LOG IN --------------------------------"
jose Sedas2016*
su 31cm@7ur1ng#_%000
su 31cm@7ur1ng#_%000
su sedas (nodo11-nodo14)
pct list # muestra todas los containers virtuales
pct enter 16052 #log in en el container 16052
pct config 16052 # ver configuración container 16052
qm # lo mismo que pct pero para las máquinas en lugar de los containers

"----------------- LUEGO DE INSTALAR CONTENEDOR INSTALLA ------------------"
nano /etc/apt/sources.list # actualiza la lista de repositorios (dejar solo lo siguiente)
	deb http://mirror.eicma.cu/debian strech main contrib
	deb http://mirror.eicma.cu/debian stretch-updates main contrib

nano /etc/resolv.conf # agregar aquí los dns

apt-get update # actualizar repositorio

" -------------------------- MONTAR NAS POR NFS --------------------------"
mkdir /mnt/nas5 # crear la carpeta donde se va a montar el nas
chmod 0777 /mnt/nas5

nano /etc/fstab # editar el archivo donde están las unidades montadas
	10.2.0.45:/shares/Public /mnt/nas5 # agregar el nas5 completo en /mnt/nas5 por nfs

mount 10.2.0.45:/shares/Public/ /mnt/nas5 # ejecutar el montaje de la unidad

umount /mnt/nas5 # si se quiere desmontar la unidad

mount -a # montar denuevo todo lo que está en /etc/fstab

"---------- CUANDO UNA MÁQUINA SE BLOQUEA O NO QUIERE REINICIAR ----------"
vm unlock número del container
pct unlock

"-------------------- COPIAR HACIA LA MÁQUINA VIRTUAL --------------------"
pct push no_maquina_virtual camino_al_archivo destino_en_proxmox
pct pull

"----------------------- AGREGAR NAS A CONTENEDOR ------------------------"
nano /etc/pve/lxc/16009.conf # editar este archivo

# la carpeta public/salvas/log del nas2 va a aparecer como var/www/salvas en el contenedor
lxc.mount.entry: /mnt/nas5/SalvasLogs/Proxy/ProxyIntNac/ mnt/salvanas  none rw,bind 0 0

"---------------------------- CANCELAR BACKUP ----------------------------"
ps -aux | grep vzdump # encontrar proceso y su id (segundo número)
kill -9 processId # matar el proceso
qm unlock <vmid> # desbloquear máquina

"-------------------- CUANDO EL NODO 6 ESTÁ BLOQUEADO --------------------"
systemctl stop pve-cluster.service
pmxcfs -l

"--------------- CUANDO SE DESINCRONIZAN NODOS EN CLUSTER ----------------"
ntpdate 10.1.0.221

"------------------------- RESTAURAR POR CONSOLA -------------------------"
cd /mnt/nas5/Proxmox/dump
pct restore 335 vzdump-lxc-334-2019_04_16-11_03_17.tar.lzo --storage local-lvm

# restaurar contenedor con disco en 8 GB
pct restore 1040 vzdump-lxc-1040-2019_04_17-12_48_20.tar.lzo --storage local-lvm -rootfs 8


"------------ PARA UPGRADEAR DEBIAN JESSIE CON RECURE REPO EXPIRED -------"
apt-get -o Acquire::Check-Valid-Until=false update

"------------------------ INTERFAZ WEB NO RESPONDE -----------------------"
service pveproxy restart  # usar cuando web no responde
sysctl fs.inotify.max_user_instances=256  # usar cuando consola no responde




