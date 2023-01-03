<?php
    $servername = "localhost";
    $database = "egzamin";
    $username = "root";
    $password = "";

    $conn = new mysqli($servername, $username, $password, $database);


    if (!$conn) {
        die("Connection failed");
    }
    else{
        echo "Connected successfully<br>";
    


    // skrypt 1
    $q='SELECT zespol1, zespol2, wynik, data_rozgrywki FROM rozgrywka where zespol1 = "EVG"';

    $result1 = $conn->query($q);

    if($result1->num_rows>0){
        print_r($result1);
        var_dump($result1);
        echo "<Br>";
    }

    // skryot 2
    if(isset($_POST['playerPos']) && $_POST['playerPos']!=""){
        $pos = $_POST['playerPos'];
        echo"pos: $pos <br>";

        $q="SELECT imie,nazwisko FROM `zawodnik` WHERE pozycja_id=$pos";

        $result2 = $conn->query($q);
        if($result2->num_rows > 0){
            var_dump($result2);
        }
        else{
            $result2=null;
        }
        
    }
   
    $conn->close();
    }


?>
<!DOCTYPE html>
<html lang="PL-pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rozgrywki Futbolowe</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <div class="container">
        <section class="banner">
            <h2>Światowe rozgrywki piłkarskie</h2>
            <img src="obraz1.jpg" alt="boisko">
        </section>
        <section class="mecze">
            <!-- <div class="box">Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum facilis magni qu</div> -->
            <!-- skrypt 1 -->
            <?php
                while($row = $result1->fetch_assoc()) {
                    echo '<section class="box">
                    <h3>'.$row["zespol1"]." - ".$row["zespol2"]."</h3><h2>$row[wynik]</h2>
                    <p>w dniu $row[data_rozgrywki]</p>
                    </section>"
                    ;
                }
            ?>
        </section>
        <main>

            <section class="main">
                <h2>Reprezentacja Polski</h2>
            </section>
            
            <section class="left">
                <p>Podaj pozycję zawodników (1-bramkarze, 2-obrońcy, 3-pomocnicy,
                4-napastnicy)</p>

                <form action="" method="POST">
                    <input type="number" name="playerPos" id="playerPos">
                    <input type="submit" value="Sprawdź">
                </form>

                <!-- skrypt 2 -->
                <ul>
                    <!-- <li></li>
                 -->
                 <?php
                    if(isset($result2) && $result2!=null){
                        while($row =$result2->fetch_assoc()) {
                            echo" <li>$row[imie] $row[nazwisko]</p>";
                        }
                    }
                 ?>
                </ul>
            </section>
            
            <section class="right">
                <img src="zad1.png" alt="piłkarz">
                <p>Autor: 000000000</p>
            </section>
        </main>

    </div>

    
</body>
</html>