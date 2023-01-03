<?php
    if(isset($_POST['userName'])){
        $name = $_POST['userName'];

        echo "$name to file";

        $myfile = fopen("files/dane", "a+") or die("Unable to open file!");

        $txt = "$name \n";
        fwrite($myfile, $txt);

        fclose($myfile);

        echo "<script>alert('saved $name to file')</script>";
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
    <form method="POST">
        imie:<input type="text" name="userName">
        <button>ZAPISZ</button>
    </form>
    
</body>
</html>