<?php
    if(isset($_GET['color'])){

        $color = $_GET['color'];
        echo $color."<br>";


        $color = mb_strtolower($color, 'UTF-8');;


        echo $color.'<hr>';

        $info ="ten kolor nie jest uwzgledniony";

        if($color=="zielony") $info ="ZIELONY oznacza JEDZ";
        else if($color=="żółty") $info ="ŻÓŁTY oznacza UWAŻAJ";
        else if ($color=="czerwony") $info ="CZERWONY oznacza STÓJ";

        echo $info;
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1</title>
</head>
<body>
    <form action="" method="get">
        <input type="text" name="color">
        <!-- <input type="color" name="" id=""> -->
        <button>SEND</button>

    </form>
    
</body>
</html>