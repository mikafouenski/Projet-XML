#/bin/bash

function fichier_existe()
{
	[ -e "$1" ] && return
	echo "Pas de fichier \"$1\"." > /dev/stderr
}


function repertoire_existe()
{
	[ -d "$1" ] && return
	echo "Pas de repertoire \"$1\"." > /dev/stderr
}


fichier_existe "Makefile"
fichier_existe "master.xml"
fichier_existe "master.dtd"
fichier_existe "master.xsd"
fichier_existe "xq.txt"

fichier_existe "rapport.pdf"

repertoire_existe "xsl"
repertoire_existe "www"
fichier_existe "www/index.html"
fichier_existe "www/xq.html"
repertoire_existe "java"

exit 0

