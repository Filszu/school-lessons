<?php
    $host = "localhost";
    $user = "root";
    $pass ="";
    $db="egzamin";
    $conn = new mysqli($host, $user, $pass, $db);

    // insert book
    if(isset($_POST['title'])){

        $title=$_POST['title'];
        $pages=$_POST['pages'];

        $q = "INSERT INTO ksiazki VALUES (NULL, '$title', '$pages')";
        $result3 = $conn->query($q);  
    }
    
    // rent a book
    if(isset($_GET['rBookId'])){
        $bookId = $_GET['rBookId'];
        echo "wypożyczono książkę o id: $bookId";

        $q = "INSERT INTO wypozyczenia  VALUES (NULL, NULL, '$bookId')";
        $result4 = $conn->query($q); 
        
    }

    
    // return a book
    if(isset($_GET['rRentalId'])){
        $rentalId = $_GET['rRentalId'];
        echo "zwrócono ksiżakę [id wyp: $rentalId]";

        $q = "DELETE FROM `wypozyczenia` WHERE id= '$rentalId'";
        $result5 = $conn->query($q); 

        
    }




    // get books
    // $q = "SELECT * FROM ksiazki";
    $q = "SELECT * FROM ksiazki WHERE id not in(SELECT id_ksiazki FROM wypozyczenia)";
    $result1 = $conn->query($q);

    $books = "";
    while($row = $result1->fetch_assoc()){
        $books.= "<tr><td>$row[id]</td><td>$row[tytul]</td><td>$row[liczba_stron]</td><td><a href='?rBookId=$row[id]'><button>wypożycz</button></a></td></tr>";
    }



    // get rentals
    $q = "SELECT w.id, k.tytul, k.liczba_stron, w.data_wypozyczenia FROM wypozyczenia w, ksiazki k WHERE w.id_ksiazki=k.id; ";
    $result2 = $conn->query($q);

    $rentals = "";
    while($row = $result2->fetch_assoc()){
        $rentals.= "<tr><td>$row[id]</td><td>$row[tytul]</td><td>$row[liczba_stron]</td><td>$row[data_wypozyczenia]</td><td><a href='?rRentalId=$row[id]'><button>zwróć</button></a></td></tr>";
    }

    // var_dump($result1);
    $conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>biblioteka</title>

</head>
<style>
    th,td{
        border: 2px solid black;
    }
</style>
<body>
    <table>
        <th>id</th><th>tytuł</th><th>l.stron</th><th>opcje</th>
        <?=$books?$books:""?>

    </table>

    <br><br>
    <form method="POST">
        tytul:
        <input type="text" name="title" required><br>
        l.stron: <input type="number" name="pages" required><br>
        <input type="submit" value="dodaj książkę" ><br>
    </form>

    <br><br>
    <table>
        <th>id</th><th>tytuł</th><th>l.stron</th><td>data_wypożyczenia</td>
        <th>opcje</th>
        <?=$rentals?$rentals:""?>

    </table>
    
</body>
</html>