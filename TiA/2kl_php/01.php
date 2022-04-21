
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>01</title>
</head>
<style>
    body{
        background-color: black;
        color: white;
    }
    table{
        border: 2px solid white;
        border-radius: 15px;
        padding: 12px;
        /* width: 50%;
        display: block;
        margin: auto; */

    }
    td{
        border: 2px solid white;
        border-radius: 8px;
        padding: 5px;
    }
</style>
<body>
    <table border=1>
        <tr>
            <?php
            $j=1;
            for($j; $j<=50; $j++){
                echo "<tr>";
                for($i=1; $i<=10; $i++){
                    echo "<td>".$j."_".$i."</td>";
                    
                    
                }
            }
            echo "</tr>";
                
            ?>
        </tr>
    </table>
</body>
</html>