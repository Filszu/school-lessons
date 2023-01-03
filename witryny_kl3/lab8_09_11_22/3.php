<?php
    require_once('visitsCounter.php')
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HEllo</title>
</head>
<style>
    body{
        margin: 0;
        display: grid;
        place-items: center;
        min-height: 100vh;
        background-color: #fcba03;
    }
    img{
        border-radius: 45px;
    }
    h1{
        text-align: center;
    }
</style>
<body>
    <div class="container">
        <h1><?=isset($visits)?$visits:""?></h1>
        <img src="files/cat.jpg" alt="hello">
    </div>
</body>
</html>