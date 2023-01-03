<?php

    $host="localhost";
    $user="root";
    $pass="";
    $db="";

    echo "$host | $user | $pass | $db";
    

    $conn = new mysqli($host, $user, $pass);

    $q= "CREATE DATABASE 3Td_2";


    if ($conn->query($q) === TRUE) {
        echo "Database created successfully";
      } else {
        echo "Error creating database: " . $conn->error;
      }


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
