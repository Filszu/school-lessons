<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>02</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="" method="POST">
        <select name="select1" id="">

            <!-- <option value="AA">ss</option> -->
            <?php
                for($i=1; $i<=1000; $i++){
                    if($i==5){
                        echo"<option  value=\"".$i."\" selected>text".$i."</option>";
                    }
                    else{
                        echo"<option value=\"".$i."\">text".$i."</option>";
                    }
                    

                }
            ?>
        </select>
        <input type="submit" value="wyślij zapytanie">
    </form>
    
</body>
</html>