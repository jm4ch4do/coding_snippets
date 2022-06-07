" ------------------------ DIRECCIÓN SITIOS ------------------------- "
/var/www/

" ---------------------- DIRECCIÓN DATABASE ------------------------- "
# la mayoría de las bases de datos de mysql están en:
database 	nodo3 	172.16.64.13	root sedas
172.16.64.13/phpmyadmin	# buscar base de datos y exportar

# la mayoría de las bases de datos de postgres están en 
database1   ESX 13   172.16.64.14

# aquí dice donde está la base de datos para drupal
/var/www/noticias/sites/default/settings.php

# aquí dice donde está la base de datos para codeigniter
/home/sitios/ecominag4/application/config

# aquí dice donde está la base de datos para wordpress
nano /var/www/html/www.new.minag.gob.cu/wp-config.php

# aquí dice donde está la base de datos para drupal
nano /var/www/www.minag.gob.cu/sites/default/settings.php

" --------------------- REINICIAR SERVICIO WEB ---------------------- "
/opt/lampp/lampp start

password postgres: superadmin

" -------------------- SALVAR BASE DATOS POSTGRES ------------------- "
pg_dump -U postgres -W -h 127.0.0.1 ecominag_2017 > /home/ecominag_2017_20181023.sql