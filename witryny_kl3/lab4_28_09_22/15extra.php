<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>15</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <table>
        <?php
            $x=0;$y=1;
            for($j=1; $j<=10; $j++){

                echo"<tr>";
                echo "<td class='td--axes'>$j</td>";

                for($i=1; $i<=10;$i++){
                
                if($j==1)echo"<td class='td--axes'>";
                else echo "<td>";
                echo $i*$y."</td>";
                }
                
                $y++;
                echo"</tr>";
            }
            

        ?>
    </table>
    
    </div>
    
</body>
</html>