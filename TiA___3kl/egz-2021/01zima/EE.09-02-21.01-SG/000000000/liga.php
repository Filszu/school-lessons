<?php   
    $db = "egzamin";
    $host = "localhost";
    $user = "root";
    $pass = "";
    $conn = new mysqli($host,$user,$pass,$db);

    if (!$conn) {
        echo "connecting error";
        exit();
    }
    else{
        echo "connected";
    }

    // skypt 1
    
    if(isset($_POST['pos'])&&$_POST['pos']!=null){
        $pos = $_POST['pos'];
        // echo $pos;

        $q = "SELECT imie,nazwisko, pozycja_id FROM zawodnik WHERE pozycja_id=$pos; ";
        // $result1 = $conn->query($q);
        // var_dump($result1);
        // // print_r($result1);

        $result2 = $conn->query($q);
        if($result2->num_rows > 0){
            // var_dump($result2);
            // print_r($result2);

            $avaible_players = "";
            while($row = $result2->fetch_assoc()) {
                $avaible_players.= "<li>$row[imie] $row[nazwisko]</li>";
            }
            
        }
        else{
            $result2=null;
            echo"<br>0 results";
        }
        
    }

    // skypt 2
    $q = "SELECT zespol,punkty,grupa FROM liga ORDER BY punkty DESC";

    $result1 = $conn->query($q);
    if($result1->num_rows>0){
        $league ="";

        while($row = $result1->fetch_assoc()) {
            $league .="<div class='box'>
            <h2>$row[zespol]</h2>
            <h1>$row[punkty]</h1>
            <p>grupa: $row[grupa]</p>
            </div>
            ";
            
        }
    }
    else{
        $result1=null;
        echo"<br>0 results";

       
    }


    




    $conn->close();

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>piłka nożna</title>
    <link rel="stylesheet" href="styl2.css">
</head>
<body>
    <div class="conatiner">
        <section id="baner">
            <h3>Reprezentacja Polski</h3>
            <img src="obraz1.jpg" alt="reprezentacja">
        </section>
        <main>
            <section id="lewy">
                <form action="" method="POST">
                    <select name="pos" id="pos">
                        <!-- <option value="bramkarz">bramkarze</option>
                        <option value="obronca">obroncy</option>
                        <option value="pomocnik">pomocnicy</option>
                        <option value="napastnik">napastnicy</option> -->

                        <option value="1">bramkarze</option>
                        <option value="2">obroncy</option>
                        <option value="3">pomocnicy</option>
                        <option value="4">napastnicy</option>
                    </select>

                    <div>
                        <img src="zad2.png" alt="piłka">
                    </div>
                    
                    <input type="submit" value="Zobacz">
                    <p>Autor: 000000000</p>
                </form>
            </section>
            <section id="prawy">
                <ol>
                    <!-- <li>Lorem, ipsum dolor.</li> -->
                    <?=isset($avaible_players) ? $avaible_players : "" ?>
                </ol>
        </main>

        </section>
        <section id="glowny">
            <h3>Liga Mistrzów</h3>
        </section>

        <section id="liga">
            <!-- skrypt 2 -->
        
            <?=isset($league) ? $league : ""; ?>
            
        </section>

    </div>
</body>
</html>