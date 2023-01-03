<?php

if(isset($_GET['a_scope']))
{
    $a = $_GET['a_scope'];
    $b = $_GET['b_scope'];
    echo "a: $a b: $b <br>";
}
else {$a=0; $b=10;}

$sum = 0;
for($i=$a; $i<=$b;$i++){
    if($i%2){
        echo "$i nieparzysta<br>";
        continue;
    }
    else{
        $sum+=$i; 
        echo "$i parzysta<br>";
    }


    
}

echo "<hr> SUMA: $sum";

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
    <hr>
    <form action="">
        Podaj zakres liczb do sprawdzenia<br>
        <input type="number" name="a_scope" required >:<input type="number" name="b_scope" required>
        <button>sprawdź</button>

    </form>
    
</body>
</html>