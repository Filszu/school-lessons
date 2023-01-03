<?php

$content="";
if(isset($_GET['num1'])){
    $num1 = $_GET['num1'];
    $num2 = $_GET['num2'];

    $result = divide($num1,$num2);
    // $content= "$num1 / $num2 =".round($result,2);
    $content= "$num1 / $num2 =".$result;
 
}

function divide($dividend, $divisor) {
    $result=0;
    try {
        if($divisor == 0) {
            throw new Exception("Division by zero");
        }
        $result=($dividend/$divisor);
        $result = round($result,2);
       
    }
    catch(Exception $e) {
        return "Unable to divide. 
        <script>
        alert('Nie dziel cholero przez zero!!!');
        </script>
        ";
    } 
  
  
  return $result;

}


// try {
//     echo divide(5, 0);
//   } catch(Exception $e) {
//     echo "Unable to divide. ";
//   } finally {
//     echo "Process complete.";
//   }

// try {
//   echo divide(5, 0);
// } catch(Exception $e) {
//   echo "Unable to divide. ";
// } finally {
//   echo "Process complete.";
// }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 style="color: green">
        <?=isset($content)?$content:"";?>
    </h1>
    
    <form action="">
        <input type="number" name="num1" required> / 
        <input type="number" name="num2" required>
        <button>PODZIEL</button>
    </form>
</body>
</html>