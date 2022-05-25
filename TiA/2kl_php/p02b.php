<?php
$conn = new mysqli('localhost','root','','biblioteka') or die ("connection error");
echo "connected to db";


$sql = "SELECT * FROM kategorie";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    echo"<table border=1>";
    echo"<tr><td>id</td><td>nazwa</td></tr>";
    while($row = $result->fetch_assoc())
    { 
        echo"<tr>";
        echo "<td>".$row["kid"]."</td>";
        echo "<td>".$row["nazwa"]."</td>";
        echo"</tr>";
    }
        echo"</table>";
    } else {
        echo "0 results";
    
}

$conn->close()
?>