<?php

$zmiennax1 = 10;
$zmiennax2 = 12;

$x = $zmiennax1;
$zmiennax1 = $zmiennax2;
$zmiennax2 = $x;

echo $zmiennax1;
echo "<br>";
echo $zmiennax2;