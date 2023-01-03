<?php


function obliczPole($x,$y){return $x*$y;}
function obliczObwod($x,$y){return 2*$x+2*$y;}

$x = 20;
$y = 100;
echo "Pole prostąkąta o bokach $x i $y wynosi: ".obliczPole($x,$y)."a Ob: ".obliczObwod($x,$y);
