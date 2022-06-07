// ---------- BÁSICO ----------
crontab -l 		// visualiza (lista) el crontab
crontab -e 		// editar crontab
crontab -r 		// borra el cron del usuario
crontab -u root -l 		// cambia al cron del usuario root y lo lista 
crontab archivo.cron // establece el archivo como el cron del usuario

nano /etc/crontab // aquí está el crontab del root
nano /var/spool/cron // aquí estan los cron del los usuarios

nano /etc/cron.deny // aquí se ponen los usuarios que no pueden usar cron
nano /etc/cron.allow // los que pueden usar

/etc/init.d/cron restart

// ---------- Formato ----------
Minute      Hour	Date	Month		DOW     
 0-59	    0-23    1-31	1-12		0-7
 						   JAN-DEC	  SUN-SAT

  * //significa todo en cualquiera de los campos

// ejemplo
12,46       6-12  7,29    MAR,AUG      MON-FRI


// ejemplo: ejecutar cada hora
0 * * * *

// cada cinco minutos
*/5   *	* * *

// ejecutar a las 9:30am y a las 5:30pm entre semana
30   9,17   * * MON-FRI

30   11   * * * /home/raimundo/copy_antivirus_vcl.sh

// importante el date y el day of week son or (los días del 12-17 y además los miércoles)
current_minute == 10 current_hour == 11 && current_month == * &&
(current_date == 12-17 || day_of_week == WED )





---------- ejemplo 1: Copia la actualizacion del NOD32 de Villa Clara y lo descomprime  ----------
rm -r /var/www/html/Act-Antivirus/Nod32/eset_upd
rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv6
rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv7
rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv8
rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv9


wget -r --level=0 --ignore-length -x -k -p -erobots=off -np -N --directory-prefix=/home/raimundo antivirus.uclv.cu/update/nod32/

wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip
wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_updv6.x32.x64-uclv.zip
wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_updv7.x32.x64-uclv.zip
wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_updv8.x32.x64-uclv.zip
wget  --directory-prefix=/var/www/html/Act-Antivirus/Nod32/ antivirus.uclv.cu/update/nod32/eset_updv9.x32.x64-uclv.zip

unzip /var/www/html/Act-Antivirus/Nod32/eset_upd.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/
unzip /var/www/html/Act-Antivirus/Nod32/eset_updv6.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/
unzip /var/www/html/Act-Antivirus/Nod32/eset_updv7.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/
unzip /var/www/html/Act-Antivirus/Nod32/eset_updv8.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/
unzip /var/www/html/Act-Antivirus/Nod32/eset_updv9.x32.x64-uclv.zip -d /var/www/html/Act-Antivirus/Nod32/

rm /var/www/html/Act-Antivirus/Nod32/eset_upd.x32.x64-uclv.zip
rm /var/www/html/Act-Antivirus/Nod32/eset_updv6.x32.x64-uclv.zip
rm /var/www/html/Act-Antivirus/Nod32/eset_updv7.x32.x64-uclv.zip
rm /var/www/html/Act-Antivirus/Nod32/eset_updv8.x32.x64-uclv.zip
rm /var/www/html/Act-Antivirus/Nod32/eset_updv9.x32.x64-uclv.zip

---------- ejemplo 1: Nueva Variante  ----------
#! /bin/bash
umask u=rwx,g=rwx,o=rwx
wget -r --level=0 --ignore-length -x -k -p -erobots=off -np -N --directory-prefix=/home/raimundo antivirus.uclv.cu/update/nod32/
umask 022

dir1="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd"
dir2="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6"
dir3="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7"
dir4="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8"
dir5="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9"

if [ -d "$dir1" ] && [ -d "$dir2" ] && [ -d "$dir3" ] && [ -d "$dir4" ] && [ -d "$dir5" ]; then
    cd /home/raimundo/antivirus.uclv.cu/update/nod32/
    zip -r eset_upd.x32.x64-uclv.zip eset_upd
	zip -r eset_updv6.x32.x64-uclv.zip eset_updv6
	zip -r eset_updv7.x32.x64-uclv.zip eset_updv7
	zip -r eset_updv8.x32.x64-uclv.zip eset_updv8
	zip -r eset_updv9.x32.x64-uclv.zip eset_updv9

    rm -r /var/www/html/Act-Antivirus/Nod32/eset_upd
	rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv6
	rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv7
	rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv8
	rm -r /var/www/html/Act-Antivirus/Nod32/eset_updv9

	rm -f /var/www/html/Act-Antivirus/Comprimidos/eset_upd.x32.x64-uclv.zip
	rm -f /var/www/html/Act-Antivirus/Comprimidos/eset_updv6.x32.x64-uclv.zip
	rm -f /var/www/html/Act-Antivirus/Comprimidos/eset_updv7.x32.x64-uclv.zip
	rm -f /var/www/html/Act-Antivirus/Comprimidos/eset_updv8.x32.x64-uclv.zip
	rm -f /var/www/html/Act-Antivirus/Comprimidos/eset_updv9.x32.x64-uclv.zip

	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd /var/www/html/Act-Antivirus/Nod32/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6 /var/www/html/Act-Antivirus/Nod32/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7 /var/www/html/Act-Antivirus/Nod32/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8 /var/www/html/Act-Antivirus/Nod32/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9 /var/www/html/Act-Antivirus/Nod32/

	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	mv /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/

	rm -rf /home/raimundo/antivirus.uclv.cu/

	cd /var/www/html/Act-Antivirus/Reportes
	echo "$(echo 'directorios copiados bien' | cat - nod32new.log)" > nod32new.log
	echo "$(date | cat - nod32new.log)" > nod32new.log
	echo "$(echo ' ' | cat - nod32new.log)" > nod32new.log
else
		cd /var/www/html/Act-Antivirus/Reportes
	echo "$(echo 'NO COPIADOS' | cat - nod32new.log)" > nod32new.log
	echo "$(date | cat - nod32new.log)" > nod32new.log
	echo "$(echo ' ' | cat - nod32new.log)" > nod32new.log
fi












file1="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip"
file2="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6.x32.x64-uclv.zip"
file3="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7.x32.x64-uclv.zip"
file4="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8.x32.x64-uclv.zip"
file5="/home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9.x32.x64-uclv.zip"

if [ -f "$file1" ] && [ -f "$file2" ] && [ -f "$file3" ] && [ -f "$file4" ] && [ -f "$file5" ]; then
	rm /var/www/html/Act-Antivirus/Comprimidos/eset_upd.x32.x64-uclv.zip
	rm /var/www/html/Act-Antivirus/Comprimidos/eset_updv6.x32.x64-uclv.zip
	rm /var/www/html/Act-Antivirus/Comprimidos/eset_updv7.x32.x64-uclv.zip
	rm /var/www/html/Act-Antivirus/Comprimidos/eset_updv8.x32.x64-uclv.zip
	rm /var/www/html/Act-Antivirus/Comprimidos/eset_updv9.x32.x64-uclv.zip


	cp /home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	cp /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	cp /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	cp /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/
	cp /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9.x32.x64-uclv.zip /var/www/html/Act-Antivirus/Comprimidos/

	rm /home/raimundo/antivirus.uclv.cu/update/nod32/eset_upd.x32.x64-uclv.zip
	rm /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv6.x32.x64-uclv.zip
	rm /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv7.x32.x64-uclv.zip
	rm /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv8.x32.x64-uclv.zip
	rm /home/raimundo/antivirus.uclv.cu/update/nod32/eset_updv9.x32.x64-uclv.zip


	cd /var/www/html/Act-Antivirus/Reportes
	echo "$(echo 'comprimidos copiados bien' | cat - nod32new.log)" > nod32new.log
	echo "$(date | cat - nod32new.log)" > nod32new.log
	echo "$(echo ' '| cat - nod32new.log)" > nod32new.log
fi

rm -r /home/raimundo/antivirus.uclv.cu/

---------- ejemplo 2: Copia la actualizacion del Segurmática ----------



