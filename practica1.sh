#! /bin/bash

#paso 1

grep ^t[ms] titles.cvs > titles2.cvs

var1=$(wc -l < titles.cvs)
var2=$(wc -l < titles2.cvs)
var3=$[(var1 - var2)]

echo "S'han eliminat; $var3 al primer pas"

#paso 2

grep -v "[^]*,[[:alnum:]]" titles2.cvs > titles3.cvs

grep -v "[^]*,[[\"#'¿¡]]" titles2.cvs > titles3.cvs

var4=$(wc -l < titles2.cvs)
var5=$(wc -l < titles3.cvs)
var6=$[(var4-var5)]

echo "S'han eliminat; $var6 al segon pas"

#paso 3

sed -n '/MOVIE/p' titles3.cvs > movies.cvs

sed -n '/SHOW/p' titles3.cvs > shows.cvs

var7=$(wc -l < movies.cvs)
var8=$(wc -l < shows.cvs)
var9=$[(var7+var8)]

echo "Tenim $var7 pel·licules i $var8 sèries. La suma de totes dues és $var9"


#paso 4

awk -F "," '$12 ~ /:space:/' movies.cvs > movies2.cvs #ELIMINA TODO

#awk -F "," '$12!/* - /' movies.cvs > movies2.cvs NO ELIMINA NADA


var10=$(wc -l < movies2.cvs)
var11=$[(var7-var10)]

echo "S'han eliminat $var11 línies"

