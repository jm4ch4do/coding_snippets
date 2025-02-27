" ------------------------------ SERVICIO ------------------------------ "
/etc/init.d/postfix status start stop restart
service postfix status start stop restart

#  Cuando de este error 127.0.0.1[127.0.0.1]:10024
/etc/init.d/amavis restart

postfix reload
" ---------------------------- CONFIGURACIÓN --------------------------- "
# two main configuratin files
nano /etc/posfix/main.cf
nano /etc/posfix/master.cf
# show configuration
postconf  # all config values (too much)
postconf -n  # show non-default values (use this)
postconf -n  # show default values

# return mail after 3d of trying to sent
postconf -e bounce_queue_lifetime=3d
postconf -e maximal_queue_lifetime=3d 

# change maximum mail size
postconf | grep message_size_limit  # default is 10240000 (10M)
postconf -e message_size_limit=20480000  # change it to 20M
service postfix reload


" --------------------------------- LOGS ------------------------------- "
# main log file (logs start and stop)
tail /var/log/mail.log # see last ten lines
tail -f /var/log/mail.log # see last ten lines all the time




" --------------------------------- MAIL ------------------------------- "
mail # verifica tu correo luego de instalar mailutils



" ------------------------------- INSTALL ------------------------------ "
apt-get install postfix
apt-get install mailutils # instala programa útiles 




" --------------------------- BORRAR CORREOS --------------------------- "
# borrar correos de facebook
 postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /@facebookmail\.com/ { print $1 }' | tr -d '*!' | postsuper -d -

# borrar correo por su identificador
postsuper -d 0175a404a41





" ------------------------------ LOGS ------------------------------ "
cat /var/log/mail.log | grep gmail.com # revisar logs filtrados por gmail

postqueue -f

tail -f /var/log/mail.log | grep porpr.geg








---------- QUEUES ----------
ls /var/spool/postfix # lista los archivos de colas

qshape # muestras la demora de los correos en las colas
qshape deferred # muestra la cola de correos retardados

# demora de los emails
qshape -c /etc/postfix/
qshape -s
qshape -p


" ------------------------------ SERVICIO ------------------------------ "
/etc/init.d/postfix status start stop restart


---------- RADIUS ----------
tailf /var/log/freeradius/radius.log # ver usuarios que se conectan al radius

---------- WEBS ÚTILES ----------
https://mxtoolbox.com/





postqueue -p # list emails
postqueue -p | grep "email@example.com"

postsuper -f emailid_number
postqueue -i emailid_number


