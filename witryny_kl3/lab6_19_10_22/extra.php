<?php

    if(isset($_GET['pattern']))
    {
        $patetrn = $_GET['pattern'];
        $fields = explode(",",$patetrn);
    }
    else{
    $fields = [0,0,0,0,0,
               0,0,0,0,0,
               0,0,0,0,0,
               0,0,0,0,0,
               0,0,0,0,0,
];

    }

function draw()
{
    global $fields;
    foreach($fields as $f_id =>$field){
        echo $field;
        if(($f_id+1)%5==0){
            echo "<br/>";
        }
    }
}

draw();

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
    <br>
    <br>
    generator use ","
    <form method="get">
        wpisz wzór rysunku
        <input type="text" name="pattern">
        <input type="submit" value="enter">
    </form>
</body>
</html>