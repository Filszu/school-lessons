<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>15</title>
</head>
<body>
    <table border=1>
        <?php
            $x=0;$y=1;
            for($j=1; $j<=10; $j++){

                echo"<tr>";
                echo "<td>$j</td>";

                for($i=1; $i<=10;$i++){
                echo "<td>".$i*$y."</td>";
                }
                
                $y++;
                echo"</tr>";
            }
            

        ?>
    </table>
    
</body>
</html>