<?php
session_start();
if (isset($_SESSION['errors'])){
    echo "<p style='color:red'>abc </p>";
    echo $_SESSION['errors'];
    unset($_SESSION['errors']);
}


$conn = null;
function db_connect(){
    return new PDO("mysql:host=localhost;dbname=library", "root", "");
    echo "connected to db";
}
function db_disconect(){
    if(isset($conn)){
        return $conn = null;
    }
}

$conn = db_connect();

//--------------------wypożyczenia--dodaj--------------------------
if(isset($_POST['person_id'])){
    if($_POST['person_id']!="unknown")
    {

    
        echo "person_id: ".$_POST['person_id']."<br>";
        
        

        $s_id = $_POST['person_id'];

        foreach($_POST['books'] as $book_id){
            echo "book id: ".$book_id."<br>";

            $sql = 'INSERT INTO rental
                VALUES (null,:student_id, :book_id, null, "2022-10-11")';
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':student_id', $s_id);
            $stmt->bindValue(':book_id',$book_id);
            $stmt->execute();   
            log_history(1,$conn);      
        }
        
        // header('Location: ?reload=1');
    }
    else{
        $_SESSION['errors']="Wybierz właściwą osobę";
    }
    

    
 

}


//zwroty

if(isset($_GET['del'])){
    $ren_id= $_GET['del'];
    echo "deleted_renatl=>id : ".$ren_id;//renatl id


    $stmt = $conn->prepare('DELETE FROM rental WHERE id = :id'); 
    $stmt->execute(array(':id' => $ren_id)); 
    echo 'Usunięto '.$stmt->rowCount().' rekordów';
    log_history(2,$conn);

    // header('Location: ?reload=1');
    
    
}


// $conn = new PDO("mysql:host=localhost;dbname=library", "root", "");

function reload_content($conn){
    show_available_books($conn);
    show_rentals($conn);
    show_logs($conn);
}

reload_content($conn);


//------------------------BOOOOOOKSSSSSSSSSSSSSSSSSSSSSSSSSS
//SELECT * FROM books b, rental r where (b.id in(r.book_id))  and b.id=r.book_id;
// SELECT b.* FROM books b where b.id not in(select book_id from rental);
function show_available_books($conn) {
$sql = "SELECT b.* FROM books b where b.id not in(select book_id from rental);";
echo "<form method='post'>"; //action='index.php'
echo"<table border=1>";
echo"<tr><td><input type='checkbox' name='checkAll' id='checkAll'></td><td>id</td><td>tytuł</td><td>autor</td><td>rok wydania</td><td>liczba stron</td></tr>";
foreach ($conn->query($sql) as $row)
{ echo"<tr>";
echo "<td><input type='checkbox' name='books[]' value='$row[id]' id='check1'></td>";
echo "<td>".$row["id"]."</td>";
echo "<td>".$row["title"]."</td>";
echo "<td>".$row["author"]."</td>";
echo "<td>".$row["release_date"]."</td>";
echo "<td>".$row["pages_number"]."</td>";

echo"</tr>";

}
echo "<tr>";
echo"<td colspan=\"6\"><select name='person_id' id=\"person_id\">
<option value='unknown'>osoba</option>";
$sql = "SELECT id, name, surname from students ";
foreach ($conn->query($sql) as $row){
    echo "<option value='" . $row['id'] ."'>$row[id] | $row[name]  $row[surname]</option>";
}


echo "</select><input type=\"submit\" value=\"wypożycz\"></td>";
echo "</tr>";

echo "</table>";

echo "</form>";
}





function show_rentals($conn){
    //---------------rentals--------------------
    echo"<table border=1>";
    echo "<tr>
        <th>id</th>
        <th>tytuł</th>
        <th>autor</th>        
        <th>data_wyp</th>
        <th>data_zwrotu</th>
        <th>student</th>
        <th>delete</th>
    </tr>";

    $sql = "SELECT r.id, b.title, b.author, r.borrow_date, r.return_date, s.id as s_id, s.name, s.surname FROM rental r,books b,students s where r.student_id = s.id and r.book_id=b.id";

    foreach ($conn->query($sql) as $row){
        echo"<tr>";
        echo "<td>".$row["id"]."</td>";
        echo "<td>".$row["title"]."</td>";
        echo "<td>".$row["author"]."</td>";
        echo "<td>".$row["borrow_date"]."</td>";
        echo "<td>".$row["return_date"]."</td>";
        echo "<td>$row[s_id] | $row[name] $row[surname]</td>";
        echo "<td><a href='?del=".$row["id"]."'><button>delete</button></a></td>";
        

    echo"</tr>";
    }

    echo "</table>";
}

//-----------------logs table----------------
function show_logs($conn)
{
    echo "logs";
    echo"<table border=1>";
    echo "<tr>
        <th>id</th>
        <th>action</th>
        <th>time</th>
    </tr>";

    $sql = "SELECT * FROM history";

    foreach ($conn->query($sql) as $row){
        echo"<tr>";
        echo "<td>".$row["id"]."</td>";
        echo "<td>";
        if($row["action_id"]==1){
            echo "wypożyczono ksiazkę";
        }
        elseif($row["action_id"]==2){
            echo"zwrócono książkę";
        }
        
        echo"</td>";
        echo "<td>".$row["time"]."</td>";
        

    echo"</tr>";
    }

    echo "</table>";
}

// ---------------------save logs --------------------
function log_history($action,$conn){
    $sql = 'INSERT INTO history 
        VALUES(null,:action,null)';
    $q = $conn->prepare($sql);
    $q->bindValue(':action',$action);
    $q->execute(); 
}


// echo "last action<br>";
// print_r($_POST['books']);



$conn = db_disconect();