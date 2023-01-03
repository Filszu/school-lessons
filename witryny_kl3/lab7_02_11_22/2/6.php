<?php
// LAB 3 cw6

function obliczPole($x,$y){return $x*$y;}
function obliczObwod($x,$y){return 2*$x+2*$y;}

if(isset($_GET['x'])){
    $x=$_GET['x'];
    $y=$_GET['y'];

}
else{
    $x = 20;
    $y = 100;
}


echo "Pole prostąkąta o bokach $x i $y wynosi: ".obliczPole($x,$y)."a Ob: ".obliczObwod($x,$y);
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
<form action="">
    x:
    <input type="text" name="x" required>
    y:
    <input type="text" name="y" required>
    <button>SEND</button>
    
    
</form>
</body>
</html>