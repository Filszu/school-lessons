<?php
    $host="localhost";
    $user ="root";
    $pass="";
    $db= "egzamin";

    $conn = new mysqli($host, $user, $pass, $db);

    // insert new student
    if(isset($_POST['imie']))
    {
        $imie = $_POST['imie'];
        $nazwisko= $_POST['nazwisko'];
        $miasto= $_POST['miasto'];
        $klasa = $_POST['klasa'];
        
        // echo $imie,$nazwisko,$miasto,$klasa;
        $q4="INSERT INTO uczen VALUES (NULL, '$imie', '$nazwisko', '$miasto', '$klasa') ";
        $result = $conn->query($q4);
    }

    // delete student

    if(isset($_GET['delete_student']))
    {
            $studentId=$_GET['delete_student'];
            $q5 = $studentId=="all"?"DELETE FROM uczen":"DELETE FROM uczen where id=$studentId";
            $result = $conn->query($q5);
    }

    
    


    // get students
    $q1="SELECT u.id, u.imie, u.nazwisko, m.miasto, k.klasa FROM uczen u, miasto m,klasa k WHERE u.id_miasta=m.id AND u.id_klasy=k.id ORDER BY u.id";

    $result=$conn->query($q1);

    $students_rows="";
    while($row=$result->fetch_assoc()){
        $students_rows.="<tr>
        <td>$row[id]</td>
        <td>$row[imie]</td>
        <td>$row[nazwisko]</td>
        <td>$row[miasto]</td>
        <td>$row[klasa]</td>
        <td><a href='?delete_student=$row[id]'><button>usuń</button></a></td>
        </tr>";
    }

    // get cities

    $q2= 'SELECT * FROM miasto';
    $result =$conn->query($q2);

    $city_options="";
    while($row=$result->fetch_assoc()){
        $city_options.="<option value='$row[id]'>$row[miasto]</option>";
    }

    // get classes

    $q3 = 'SELECT * FROM klasa';

    $result =$conn->query($q3);

    $class_options="";
    while($row=$result->fetch_assoc()){
        $class_options.="<option value='$row[id]'>$row[klasa]</option>";
    }





    $conn->close();


?>

<!DOCTYPE html>
<html lang="PL-pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>egzamin</title>
</head>
<style>
    body{
        background-color: black;
        color: white;
        /* display: flex;
        align-content: center; */
    }
    tr,th,td,button{
        border: 2px solid white;
        padding: 5px 20px;
    }
</style>

<body>
    <table>
        <tr>
            <th>id</th><th>imie</th><th>nazwisko</th><th>miasto</th><th>klasa</th><th><a href='?delete_student=all'><button>usuń</button></a></th>
        </tr>
        <?=isset($students_rows)?$students_rows:"brak uczniów"?>
    </table>

    <!-- form -->

    <form method="POST">
        
        imie <input type="text" name="imie" required><br>
        nazwisko <input type="text" name="nazwisko" required><br>
        miasto:
        <select name="miasto" id="miasto" required>
            <?=isset($city_options)?$city_options:""?>
        </select><br>
        klasa
        <select name="klasa" id="" required>
            <!-- <option value=""></option> -->
            <?=isset($class_options)?$class_options:""?>
        </select><br>
        <button>DODAJ UCZNIA</button>
        
    </form>
</body>
</html>