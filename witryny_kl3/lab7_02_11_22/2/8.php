<?php
// LAB 3 8
    if(isset($_GET['num']))
        $z=$_GET['num'];
    else $z = 111;

    if($z>99 || $z<-99) echo "$z to liczba 3 cyfrowa";
    else echo "$z - nie jest to liczba 3 cyfrowa";

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
        <input type="number" name="num" required><button>send</button>
    </form>
</body>
</html>