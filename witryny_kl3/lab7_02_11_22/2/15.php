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
        // LAB4 15
            if(isset($_GET['colA']))
            {
                $colA = $_GET['colA'];
                $colB = $_GET['colB'];
            }
            else{
                $colA=10;
                $colB =10;
            }
            $x=0;$y=1;
            for($j=1; $j<=$colA; $j++){

                echo"<tr>";
                echo "<td class='td--axes'>$j</td>";

                for($i=1; $i<=$colB;$i++){
                
                if($j==1)echo"<td class='td--axes'>";
                else echo "<td>";
                echo $i*$y."</td>";
                }
                
                $y++;
                echo"</tr>";
            }
            

        ?>
    </table>

    <form action="">
        <div>
            DRAW TABLE
        </div>
        <div>
            <input type="number" name="colA" id="" required placeholder="col A">
        </div>
        <div>
            <input type="number" name="colB" id="" required placeholder="col B">
        </div>
        
        
        <button>SEND</button>
    </form>
    
    </div>
    
</body>
</html>