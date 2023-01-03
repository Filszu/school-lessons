<?php
    session_start();
    if(isset($_SESSION['puzzle'])&&$_SESSION['puzzle']!=false){
        $puzzle = $_SESSION['puzzle'];
    }
    else{
        $puzzle = rand(1,10);
        $_SESSION['puzzle']=$puzzle;
    }
    // echo "liczba do zgadniecia: $puzzle";


    if(isset($_GET['num'])){
        $num = $_GET['num'];
        // echo $num;
    

        $havePlayerWon = false;
        $info = "";

        try{
            if($num==$puzzle) {
                throw new Exception("BRAVO");
            }
        }
        catch(Exception $e) {
                $havePlayerWon = true;
        } 

        if($havePlayerWon == true){
            $info= "BRAWO ZGADŁEŚ LICZBĘ"; 
            $_SESSION['puzzle']=false;
            
        }
        else if($havePlayerWon == false){
            $info = "Nie masz dzisiaj szczescia :(  To nie jest liczba $num";
            
        }

    }
        
        
        
    


    

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>zgadnij liczbe</title>
</head>
<style>
    .correct{
        color: green;
    }
    /* .incorect{
        color:red;
    } */
</style>
<body>
    <h1>ZGADNIJ LICZBĘ OD 1-10</h1>
    <h2 class="correct"><?=isset($info)?$info:""?></h2>
    <form action="">
        <input type="number" name="num" id="num">
        <button>ZGADADUJE</button>
    </form>
</body>
</html>