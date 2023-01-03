<?php

$imiona = ["Filip"=>"Sz","Irwyd"=>"Wyd","MareckiOK"=>"Szu","KonradDino"=>"KO"];



printNames($imiona);

asort($imiona);

printNames($imiona);




function printNames($names){
   foreach($names as $name=>$surname){
    echo "$name : $surname<br>";
    } 
    echo "<hr>";
}


var_dump($imiona);