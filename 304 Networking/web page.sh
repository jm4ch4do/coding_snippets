" ---------------------- MONTAR PÁGINA EN DEBIAN 9, PHP7,MYSQL ------------------------- "
# crear entrada en el DNS

# mysql and MariaDB
apt install mariadb-client mariadb-server

# php
apt install php7.0 php7.0-mysql     (php php-pgsql libapache2-mod-php)
apt -y install php php-cgi libapache2-mod-php php-common php-pear php-mbstring php-gettext

# apache
apt install apache2

# testing
nano /var/www/html/test.php
   <?php phpinfo(); ?>

# entrar a localhost para ver apache y a localhost/test.php para comprobar php

# establecer la zona horaria correcta
nano /etc/php/7.0/apache2/php.ini
  date.timezone = "America/Havana"
service apache2 restart

# instalar phpmyadmin
apt-get install phpmyadmin

# Habilitar phpmyadmin en el apache
nano /etc/apache2/apache2.conf
  # Habilitar phpmyadmin
  Include /etc/phpmyadmin/apache.conf
service apache2 restart

# configurar phpmyadmin
#dpkg-reconfigure phpmyadmin

# el phpmyadmin se conecta a mysql con los datos que estan en este archivo y que no tiene todos los privilegios
nano /etc/phpmyadmin/config-db.php 

#  crear nuevo usuario con privilegios full para usar en la interfaz web de phpmyadmin
mysql --user=root mysql
  CREATE USER 'phpmyadmin2'@'localhost' IDENTIFIED BY 'Sedas2016*';
  GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin2'@'localhost' WITH GRANT OPTION;
  exit

# último paso configuración
a2enmod rewrite

# para permitir subir archivos grandes en phpmyadmin
nano /etc/php/7.0/apache2/php.ini
  upload_max_filesize = 20M
  post_max_size = 30M # siempre mayor que el anterior
reboot

# con phpmyadmin crear un usuario con privilegios sólo para la base de datos de la web
# crear base de datos e importar las tablas con phpmyadmin

# dar permisos para la carpeta de los sitios web
chmod -R 0777 /var/www/

# copiar el sitio en /var/www usando winscp

# darle al sitio el usuario y contraseña de mysql para la base de datos de la web 
# para wordpress
nano /var/www/html/www.new.minag.gob.cu/wp-config.php
  define('DB_NAME', 'NombreBaseDeDatos');
  define('DB_USER', 'NombreUsuario');
  define('DB_PASSWORD', 'PasswordUsuario');
# probar que el sitio funcione antes de agregar virtualhost

# crear el virtual host para el nuevo sitio
nano /etc/apache2/sites-available/www.new.minag.gob.cu.conf
<VirtualHost *:80>

        ServerName new.minag.gob.cu
        ServerAlias www.new.minag.gob.cu


        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html/www.new.minag.gob.cu


        <Directory /var/www/html/www.new.minag.gob.cu>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

# habilitar el sitio
a2ensite www.new.minaa2g.gob.cu.conf # habilitar nuevo sitio
a2dissite 000-default.conf # deshabilitar sitio por defecto
ls /etc/apache2/sites-enabled/ # comprobar que el sitio

service apache2 restart




" ---------------------- MONTAR PÁGINA EN UBUNTU 18, PHP7.2,POSTGRESS 9.6 ------------------------- "
# crear entrada en el DNS
# crear usuarios que van a entrar, darles sudo y darles permiso por la red
























































<VirtualHost *:80>
    ServerName new.minag.gob.cu
    ServerAlias www.new.minag.gob.cu
    ServerAdmin telematica2@eicma.cu
    DocumentRoot /var/www/www.new.minag.gob.cu

    <Directory /var/www/www.new.minag.gob.cu>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Require all granted
      allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/new.minag.gob.cu-error.log
    CustomLog ${APACHE_LOG_DIR}/new.minag.gob.cu-access.log combined
</VirtualHost>



# habilitar los host virtuales
# se crea un enlace directo (simbolic link)
ln -s /etc/apache2/sites-available/www.new.minag.gob.cu.conf /etc/apache2/sites-enabled/

systemctl restart apache2












# apuntar el apache hacia la página
nano /var/www/.htaccess
  RewriteBase /intranet2/        cambiar para       RewriteBase /
  RewriteRule . /intranet2/index.php [L]       cambiar para RewriteRule . /index.php [L]

# corregir configuración apache
nano /etc/apache2/sites-enabled/000-default.conf
# pegar después de "ServerAdmin webmaster@localhost"
DocumentRoot /var/www

<Directory "/var/www">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
</Directory>















#phpenmod mbstring
#sudo systemctl restart apache2
#a2enconf php7.0-cgi

