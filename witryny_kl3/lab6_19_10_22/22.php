<?php

    function testLiczby($num){
        if($num<0)
        return true;
        else
        return false;
    
    }



    echo "Liczba";
    echo "czy mniejsza od 0:   ";
    echo testLiczby(-100)?'true':'false';