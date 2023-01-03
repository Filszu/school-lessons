<?php
    if(isset($_GET['reset'])){
        // echo "reset";
        $reset=true;
    }
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
    .infoBox{
        display: flex;justify-content: center;
        flex-direction: column;
    }
    button{
        width: 100%;
        padding: 15px;
        border-radius: 45px;
        margin: 10px 0;

    }
</style>
<body>
    <div class="container">
        <div class="infoBox">
            <h1><?=isset($visits)?$visits:""?></h1>
            <br>
            <a href="?reset=1"><button onclick='alert("RESET")'>RESET COUNTER</button></a>
        </div>
       
        
        <img src="files/cat.jpg" alt="hello">
        
    </div>
    
</body>
</html>