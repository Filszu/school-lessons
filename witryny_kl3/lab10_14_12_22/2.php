<?php

    $host="localhost";
    $user="root";
    $pass="";
    $db="";

    if(isset($_POST['host'])&&!empty($_POST['host']))
    {
        $host=$_POST['host'];
        $user=$_POST['user'];
        $pass=$_POST['pass'];
        // $db=$_POST['host']

    }

    echo "$host | $user | $pass | $db";
    

    $conn = new mysqli($host, $user, $pass);

    $conn->close();
    
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
    <form action="" method="post">
        <input type="text" name="host" required>
        <input type="text" name="user" required>
        <input type="text" name="pass" required>
       <button>connect</button>
    </form>
</body>
</html>
