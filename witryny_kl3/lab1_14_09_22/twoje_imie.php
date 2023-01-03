<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
        echo "<p><b>kierunek</B>: programista<br>
        <b>klasa: </b>3td<br>
        <b>imie: </b>Filip<br>
        <b>nazwisko:</b>Szumowski
        </p>
        ";
    

    ?>

    <hr>
    tests
    <br>

    <!-- nie dziala -->
    <? echo ("to jest najprostsza metoda, podobna do SGML'a"); ?>
    <script language="php">
    echo ("niektóre edytory (np. FrontPage) nie lubią przetwarzania instrukcji");
    </script>

    <% echo ("Możesz też użyć metody podobnej do tej z ASP"); %>
    <%= $variable; # To jest skrót dla "<% echo ..." %>


    <!-- dziala -->
    <?php echo("jeśli serwujesz pliki XML, użyj tej metody"); ?>



</body>
</html>