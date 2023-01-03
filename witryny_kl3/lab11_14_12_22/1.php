<?php
    $host="localhost";
    $user="root";
    $pass="";
    $db="3Td_2";

    echo "$host | $user | $pass | $db";


    $conn = new mysqli($host, $user, $pass, $db);

    if(isset($_POST['imie'])&&!empty($_POST['imie']))
        $imie = $_POST['imie']);
        $nazwisko = $_POST['nazwisko']);
        $email = $_POST['email']);
        
        $q= 'INSERT INTO uczniowie VALUES(null,"Filip","Szumowski","email@email.com")';
    if ($conn->query($q) === TRUE) {
        echo "query completed successfully";
    } else {
        echo "Error creating table: " . $conn->error;
    }


    $conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>11.1</title>
</head>
<body>
    <form action="" method="POST">
        <input type="text" name="imie" required>
        <input type="text" name="nazwisko" required>
        <input type="email" name="email" required>
        <button>send</button>

    </form>
</body>
</html>