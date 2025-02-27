-------------------- WEBMIN --------------------
// abrir el archivo de los repositorios fuente
sudo nano /etc/apt/sources.list

// agregarl esta línea para que incluya la fuente de webmin
deb http://download.webmin.com/download/repository sarge contrib

// agregar la llave del repositorio para que el sistema confíe en él
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc

//instalar webmin
sudo apt update
sudo apt install webmin

// navegar hacia la web
https://localhost:10000 (usuario y password del usuario root)

-------------------- WEBMIN SEGUNDA VARIANTE --------------------
sudo apt install wget

wget -qO- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
sudo add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib"
sudo apt update

sudo apt -y install webmin

-------------------- CONFIGURAR BACULA --------------------
Hay que instalar libdbd-mysql-perl en ubuntu para que funcione

