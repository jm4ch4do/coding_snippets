
"-------------------- ARCHIVO DE CONFIGURACIÓN SQUID --------------------"
nano /etc/squid/squid.conf  #configuración squid

"-------------------------- REVISAR REGISTROS ---------------------------"
cat /var/log/squid/access.log | grep porn

"------------------ AUTORIZAR ACCESO A REDES SOCIALES -------------------"
nano /etc/squid/ip_permit.acl # agregar ip del proxy aquí

"-------------------------- REINICIAR SERVICIO --------------------------"
/etc/init.d/squid restart

"-------------------------- CONFIGURACIÓN SQUID -------------------------"
nano /etc/squid/squid.conf


"-------------------------- ROTA Y SALVAR LOGS -------------------------"
# crear carpetas en proxy
su

mkdir /home/scriptEICMA
mkdir /home/scriptEICMA/temp
chmod 0777 /home/scriptEICMA/
chmod 0777 /home/scriptEICMA/temp
mkdir /mnt/salvanas
chmod 0777 /mnt
chmod 0777 /mnt/salvanas/
chown jose:jose /mnt/salvanas/

# montar imagen en proxmox
su
31cm@7ur1ng#_%000

nano /etc/pve/lxc/16015.conf # poner número máquina virtual
        lxc.mount.entry: /mnt/nas5/SalvasLogs/Proxy/ProxyInt1 mnt/salvanas  none rw,bind 0 0 # pegar esto al final
pct stop 16015
pct start 16015

# comprobar que la carpeta está montada en proxy
ls -lah /mnt/salvanas

# borrar el logrotate previamente configurado
rm /etc/logrotate.d/squid
rm /etc/logrotate.d/squid.save

touch /home/scriptEICMA/squidsave.sh
chmod 0777 /home/scriptEICMA/squidsave.sh

apt-get install gawk # necesario para el script
nano /home/scriptEICMA/squidsave.sh

# ---------------
#!/bin/bash
/usr/sbin/squid -k rotate # ordena rotar los logs

# transformar logs a hora humana y poner fecha en nuevo archivo
umask u=rwx,g=rwx,o=rwx
time1="proxyint1log$(date +"%Y_%m_%d_%I_%M_%p").log"
touch /home/scriptEICMA/temp/$time1
cat /var/log/squid/access.log.0 | awk '{printf("%s ", strftime("%d/%b/%Y:%H:%M:%S",$1)); print $2 " " $3 " " $4 " " $5" " $6 " " $7 " " $8 " " $9 " " $10;}' > /home/scriptEICMA/temp/$time1
gzip /home/scriptEICMA/temp/$time1
chmod 0777 /home/scriptEICMA/temp/$time1*
chown jose:jose /home/scriptEICMA/temp/$time*
cp /home/scriptEICMA/temp/$time1* /mnt/salvanas
rm /home/scriptEICMA/temp/$time1*
umask 022
# ------------
su
crontab -e
        50 23 * * * /root/squid.sh # quitar esta línea
        58 23 * * * /home/scriptEICMA/squidsave.sh # y poner esta

nano /etc/squid/squid.conf
# ---------- CANTIDAD DE LOGS A ROTAR ---------- #
logfile_rotate 1 # rotar al menos un log

/etc/init.d/squid restart

# probar el script
/home/scriptEICMA/squidsave.sh

# ver si salvó
ls -lah /mnt/salvanas/


