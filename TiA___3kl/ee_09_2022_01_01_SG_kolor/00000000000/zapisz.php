<?php

    $host = "localhost";
    $user = "root";
    $pass="";
    $db="wedkowanie";


    $conn = new mysqli($host, $user, $pass, $db);

    if(isset($_POST['imie'])&&isset($_POST['nazwisko'])&&isset($_POST['adres'])&&!empty($_POST['imie'])){

    }
    else{
        echo "podaj wszystkie pola";
    }

    $imie = $_POST['imie'];
    $nazwisko = $_POST['nazwisko'];
    $adres = $_POST['adres'];


    $sql = "INSERT INTO karty_wedkarskie VALUES (NULL, '$imie', '$nazwisko', '$adres', NULL, NULL)";


    $result = $conn -> query($sql);

    echo $result;
    echo "<br>nowa karta na dane: $imie $nazwisko, $adres";



    $conn -> close();



?>