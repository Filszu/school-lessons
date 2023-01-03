<?php

$imiona = ["Filip","Irwyd","MareckiOK","KonradDino"];


printNames($imiona);

sort($imiona);

printNames($imiona);

rsort($imiona);

printNames($imiona);



function printNames($names){
   foreach($names as $name){
    echo $name."<br>";
    } 
    echo "<hr>";
}
