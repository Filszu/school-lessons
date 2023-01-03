<?php

$sum = 0;
for($i=0; $i<=10;$i++){
    if($i%2){
        echo "$i nieparzysta<br>";
        continue;
    }
    else{
        $sum+=$i; 
        echo "$i parzysta<br>";
    }


    
}

echo "<hr> SUMA: $sum";