<?php

throw new Exception('File not found.');
    session_start();
    $path = array(1,0,0,0,0,0,0,0,0,0);
    
    if(isset($_GET['steps'])){
        $steps = $_GET['steps'];
        echo $steps;
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAME</title>
</head>
<body>
    <form action="
    ">
    <input type="submit" name="steps" value="L" />
    <input type="submit" name="steps" value="R" />

    </form>
</body>
</html>