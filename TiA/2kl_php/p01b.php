<?php
$conn = new mysqli('localhost','root','','cw01') or die ("connection error");
echo "connected to db";
$conn->close()
?>

