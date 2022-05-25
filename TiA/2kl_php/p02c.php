<?php
$conn = new PDO("mysql:host=localhost;dbname=biblioteka","root","");
echo "connected to db :)";


$sql = "SELECT * FROM kategorie";

echo"<table border=1>";
echo"<tr><td>id</td><td>nazwa</td></tr>";
foreach ($conn->query($sql) as $row)
{ echo"<tr>";
echo "<td>".$row["kid"]."</td>";
echo "<td>".$row["nazwa"]."</td>";
echo"</tr>";
}
echo"</table>";


$conn=null;

?>