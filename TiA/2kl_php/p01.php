<?php
$conn = mysqli_connect('localhost','root','','cw01') or die ("connection error");
echo "connected to db";
mysqli_close($conn);
?>

