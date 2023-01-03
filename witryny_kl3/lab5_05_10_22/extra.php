<?php

// prosty panel do zarzadzania uczniami

    session_start();

    if(isset($_SESSION["students"]))
    {
        $students=$_SESSION["students"];
    }
    else{
        $students = array();

        $student1 = array("name"=>"Filip", "age"=>17, "class"=>"3Td");
    
    
        array_push($students, $student1);
    }
 
   

    


    if(isset($_POST["name"])){
       
        $newName=$_POST["name"];
        $newAge=$_POST["age"];
        $newClass = $_POST["class"];


        $newStudent=array("name"=>$newName, "age"=>$newAge, "class"=>$newClass);
        array_push($students, $newStudent);
    }
    else{
        echo "blah blah";
    }

    $_SESSION['students']=$students;
    



    var_dump($students);



    $printStudents="";

    foreach($students as $student){
        // echo var_dump($student)."<br>";

        foreach($student as $sData => $sVal){
            
            // $printStudents.="$sData[name] | $sData[age] | $sData[class]";
            // echo $sData["name"];
            // echo $sVal;
            // echo"<hr>";
            $printStudents.= $sVal." | ";
            // var_dump($sData);
            // var_dump($sVal);
        }
        $printStudents.="<hr>";
        
    } 
    

    ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School CMS</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>School CMS</h1>
        <h2>All students:</h2>
        <?=isset($printStudents)?$printStudents:""?>
        <form method="POST">
            <h2>Add new student</h2>
            <input type="text" name="name" placeholder="student name">
            <input type="number" name="age" placeholder="student age">
            <input type="text" name="class" placeholder="student class">
            <input type="submit" value="add new student">
        </form>
    </div>
    
    
</body>
</html>