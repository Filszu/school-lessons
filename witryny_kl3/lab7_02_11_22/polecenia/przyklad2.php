<?php


$string = "Bardzo dziwNe zDanie";
$string = strtoupper($string);
echo $string; // BARDZO DZIWNE ZDANIE


$string2 = "Bardzo dziwNe zDanie z polskimi znakami ą,ć, Ź, ł, ę";
$string2 = mb_strtoupper($string2, 'UTF-8');
echo $string2; // BARDZO DZIWNE ZDANIE Z POLSKIMI ZNAKAMI Ą, Ć, Ź, Ł, Ę




?>