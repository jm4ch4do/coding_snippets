

ls -l # ver archivos y permisos
ls    # ver archivos
ls -Slah # ver archivos con detalles

" ------------------------- EDITAR, CREAR, BORRAR -------------------------- "
# EDITAR
cat file.txt. | less #visualizar lentamente un archivo
cat file.txt. | more # otra forma
touch new_file # crear archivo
mv new_file new2_file # renombrar

# BORRAR
rm estearchivo.txt # borrar
rm -r estacarpeta # borrar recursivo
rm antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip

# CARPETAS
mkdir new_folder # crear carpeta
rmdir old_folder # borrar carpeta


" -------------------------------- PERMISOS -------------------------------- "
chown jose:jose /home/scriptEICMA/squidsave.sh # cambiar usuario:grupo de un fichero


" ------------------------------ WEB DOWNLOAD ------------------------------ "
# copiar hacia /home/raimundo lo que está en http://...
wget -P /home/raimundo http://antivirus.uclv.cu/update/avg/w14allx4855ms.bin
# descargar archivos desde antivirus.uclv.cu hacia /var/...
wget ‐‐directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip


" -------------------------------- PERMISOS -------------------------------- "
umask u=rwx,g=rwx,o=rwx # máscara visible para todos
umask 022 # máscara por defecto
umask #ver permisos de la carpeta
chmod -R 0777 mail # cambiar permisos carpeta y subcarpetas

chown -R jose:jose /home/jose # hacer dueño de la carpeta /home/jose a jose del grupo jose

" ------------------------------- COMPRESIÓN ------------------------------- "
# DESCOMPRIMIR
unzip antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip # descomprimir archivos
gunzip name.tar.gz # descomprimir

# COMPRIMIR ENCAPSULAR
tar -czvf intranet.tar.gz minag/  # # comprimir archivo(nombre_comprimido/carpeta_donde_guardarlo)
tar -cvf xofia.tar xofia_eicma/ # encapsular la carpeta xofia_eicma al archivo xofia.tar (no comprime)
tar -xvf xofia.tar # para desencapsular

" --------------------------------- BUSCAR --------------------------------- "
find .  # find all files in working directory (is recursive)
find . -type d  # find all directories
find . -type f  # find all files
find . -type f -name "exact_file_name"
find . -type f -iname "*file_name"  # -iname makes lowercase the same as uppercase and anything before file_name

find . -type f -mmin -10  # files modified less than 10 minutes ago
find . -type f -mmin +10  # files modified more than 10 minutes ago
find . -type f -mmin +1 -mmin -5  # files modified more than 1 minute ago but less than 5 minutes ago
