# docker.alpine_murmur
Docker image for Murmur server based on Alpine package.
* Bind mounts on Docker:
	* /etc/murmur.ini to your ini file
	* /var/lib/murmur/, /var/log/murmur/ to your database, crt files and log according to your ini file
