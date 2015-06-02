#! /bin/bash
# $1: Carpeta donde se crearán los archivos vacíos.
# $2: Número mínimo de bytes para crear archivo vacío

d=$1
min=$2
url=http://data.gdeltproject.org/events

curl -s $url/filesizes > temp001

< temp001 awk -F' ' -v min="$min" '{if($1 > min){print $2}}' \
    | while read f;
    do
	echo basura > $d/$f
    done

rm temp001

