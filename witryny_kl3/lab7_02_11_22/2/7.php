<?php
// LAB 3 /7
    if(isset($_GET['age'])){
        $myAge=$_GET['age'];
    

    }
    else $myAge = 16;

    $x=20;
    

    if($x>$myAge) echo "x jest starsza ode mnie";
    else if($x<$myAge) echo "x jest MŁODSZA ode mnie";
    else echo "x  ma tyle samo lat co ja";

    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <form action="">
            <input type="text" placeholder="your age" name="age"><button>send</button>
        </form>
    </body>
    </html>