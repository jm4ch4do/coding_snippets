" ----- levantar correo zentyal ----- "
# a veces el zentyal no levanta el servicio de correo y jabber por la interfaz web
# este ejemplo es para eas

# entrar al proxy eas por mobatex (eas.minag.cu root sedas2016)

ssh user@192.168.54.3
sedas2016

sudo su
sedas2016
# ya estás en el zentyal con root

/etc/init.d/dovecot start // inicia el correo
/etc/init.d/postfix start // inicial el correo

/etc/init.d/ejabberd start // inicia el jabber
/etc/init.d/ejabberd restart // en caso de que no pinche start


" ---------- MINAG.CU ---------- "
# entrar por mobaxterm
minag.cu (user l3n0v0G580*)



" --------------------------- PASSWORD SETTINGS ---------------------------- "
samba-tool domain passwordsettings show  # show password config

samba-tool domain passwordsettings set --max-pwd-age=0  # password never expires


samba-tool domain passwordsettings set --help  # see all options





