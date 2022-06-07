" ------------------------ CREAR ARCHIVO BASH ------------------------- "
nano /etc/raimundo/test.sh
	(dentRo del archivo)
#!/bin/bash //especifica el programa que ejecuta el archivo
# My first script //esto es un comentario
echo "Hello World!" //jeje
    (fuera del archivo)
chmod 755 test.sh //permisos

" ----------------------- EJECUTAR ARCHIVO BASH ----------------------- "
./test.sh

" ------------------------- DEFINIR VARIABLES ------------------------- "
myName = "Jose" # string
declare -r NUM1=5 # constante numérica
num2=4
num3=$((NUM1+num2))

" ------------------------- FILTRADO DE TEXTOS ------------------------ "
mailq | grep Requests # toma la última línea que es la que dice Request
	-- 80251 Kbytes in 498 Requests. # este es el resultado

mailq | grep Requests | cut -f 5 -d ' ' # toma el quinto campo usando como delimitador al espacio
	498 # este es el resultado


" --------------- COPIAR DESDE LA WEB HACIA UNA LOCACIÓN -------------- "
# se copia desde antivirus.uclv.cu... hacia /var/www/....
rm -r /var/www/html/Act-Antivirus/Nod32/eset_upd
wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip
unzip /var/www/html/Act-Antivirus/Nod32/eset_upd.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/
rm /var/www/html/Act-Antivirus/Nod32/eset_upd.x32.x64-uclv.zip




" --------------- PREGUNTAR POR EL SHELL EN USO -------------- "
echo $0 # preguntar por shell en uso
stty sane # poner configuración del shell en parámetros standard
control+W # borrar palabra
control+x or control+x # borrar línea
control+c # terminar programa
help while # obtener ayuda sobre el comando while de bash
whatis who # despliega comando que empiezan con who
info coreutils # obtener ayuda del comando linux coreutils 
cat --help # ayuda del comando cat
para poner ** hay que escribir \*\*, también puede escribirse '**'. # caracter de escape