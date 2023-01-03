<?php
$wartosci = [1, 15, 12, 51, 8, -11];
$suma=0;

for($i=0; $i<count($wartosci); $i++){
    $suma+=$wartosci[$i];
}

echo $suma;