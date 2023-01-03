<?php

use LDAP\Result;

    $user ="root";
    $db ="egzamin";
    $host = "localhost";
    $pass = "";

    $conn = new mysqli($host,$user,$pass, $db);

    if($conn){
        echo "connected";
         // skrypt 1 
        $q ="SELECT informacja,wart_min, wart_max FROM `bmi`";
        $result1= $conn->query($q);
        // print_r($result1->fetch_all());

        $table="";
        while($row = $result1->fetch_row()){
            $table.="<tr><td>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
        }


        // skrypt2
        if(isset($_POST["waga"])&&isset($_POST["wzrost"])&&$_POST["waga"]!=""&&$_POST["wzrost"]!=""){
            // echo "waga ".$_POST["waga"];
            $m = $_POST["waga"];
            $h = $_POST["wzrost"];

            $bmi = ($m/($h**2))*10000;

            echo $bmi;

            $data ="Twoja waga $m; Twój wzrost $h <br>BMI wynosi $bmi";

            $date = Date();
            $bmiId=0;

            $q2 = "INSERT INTO `wynik` VALUES (NULL, $bmiId, $date,$bmi )";
            $result



        }
        else{
            // echo"0results";
        }


    }
    else{
        echo "connection error";
        exit();
    }

    $conn->close();
   
?>

<!DOCTYPE html>
<html lang="PL-pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twoje BMI</title>
    <link rel="stylesheet" href="styl3.css">
</head>
<body>
    <header>
        <section id="logo">
            <img src="wzor.png" alt="wzór BMI">
        </section>
        <section id="baner"><h1>Oblicz swoje BMI</h1></section>
    </header>
    <section id="glowny">
                <table>
                    <tr><th>Interpretacja BMI</th>
                    <th>Wartość minimalna</th>
                    <th>Wartość maksymalna</th></tr>
                    <!-- skrypt1 -->
                    <?=isset($table)?$table:""?>

                </table>
            </section>
        <main>
           
            <section id="lewy">
                <h2>Podaj wagę i wzrost</h2>
                <form action="" method="post">
                    <label for="waga">Waga</label><input type="number" name="waga" id="waga" min="1">
                    <label for="wzrost">Wzrost</label><input type="number" name="wzrost" id="wzrost" min="1">
                    <input type="submit" value="Oblicz i zapamiętaj wynik”">

                    <br>
                    <!-- skrypt 2 -->
                    <?=isset($data)?$data:""?>
                
                </form>

            </section>
            <section id="prawy">
                <img src="rys1.png" alt="ćwiczenia">


            </section>

        </main>
    <!-- <footer></footer> -->
    <section id="stopka">
        Autor: 000000000
        <a href="kwerendy.txt">Zobacz kwerendy</a>
    </section>
    

    
</body>
</html>