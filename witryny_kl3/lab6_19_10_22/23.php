<?php

    function checkNum($num){
        if($num%5==0  && $num%7==0){
            return true;
        }
        return false;
    }


    echo checkNum(35)?'true':'false';
