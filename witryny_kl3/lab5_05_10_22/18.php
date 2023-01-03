<?php
$wartosci = [20, 17, 22, 20, 16, 31, 22, 15, 13, -12, 16, 7, 1, 0, -7, -10];
$suma=0;

for($i=0; $i<count($wartosci); $i++){
    $suma+=$wartosci[$i];
}

$avg = round($suma / count($wartosci));

echo $avg;