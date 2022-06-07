---------- ubuntu behind proxy ----------
# en proxmox elegir la opción SPICE para display y configuración mínima para ubuntu
# para la red del sistema ir a arriba derecha settings (destornillador y llave)-> network -> network proxy
# ponerlo en manual y especificar proxys

export http_proxy="http://172.16.64.128:3128"
export https_proxy="https://172.16.64.128:3128"
export ftp_proxy="http://172.16.64.128:3128"
unset http_proxy

# para que funcione el apt-get update
nano /etc/environment
# agregar las líneas

http_proxy=http://172.16.64.128:3128
https_proxy=https://172.16.64.128:3128
ftp_proxy=http://172.16.64.128:3128



http_proxy=http://172.16.64.128:3128
https_proxy=https://172.16.64.128:3128
ftp_proxy=http://172.16.64.128:3128

http_proxy="http://jose:Sedas2016*@172.16.64.128:3128/"
https_proxy="https://jose:Sedas2016*@172.16.64.128:3128/"
ftp_proxy="http://jose:Sedas2016*@172.16.64.128:3128/"

# reiniciar la máquina
apt-get update


' --------------- instalar aplicaciones ubuntu --------------- ' 
sudo apt-get install synaptic // package installer
// dolphin file manager
// xrdp para conectarse por cliente remoto desde linux

' ---------------------- lista de fuentes --------------------- ' 
nano /etc/apt/sources.list

deb http://ftp.debian.org/debian stretch main contrib

deb http://ftp.debian.org/debian stretch-updates main contrib

deb http://security.debian.org stretch/updates main contrib


#agregar 
deb http://ftp.debian.org/debian stable main contrib non-free


deb http://deb.debian.org/debian stretch main
deb-src http://deb.debian.org/debian stretch main

deb http://deb.debian.org/debian-security/ stretch/updates main
deb-src http://deb.debian.org/debian-security/ stretch/updates main

deb http://deb.debian.org/debian stretch-updates main
deb-src http://deb.debian.org/debian stretch-updates main



# sources del debian 9
deb http://ftp.debian.org/debian stretch main contrib
deb http://ftp.debian.org/debian stretch-updates main contrib
deb http://security.debian.org stretch/updates main contrib
