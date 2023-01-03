<?php
    // if (file_exists($target_file)){

    // }

    $filename="files/dane";

    if (file_exists($filename)) 
    {
       
        $myfile = fopen($filename, "r") or die("Unable to open file!");
        // echo fread($myfile,filesize($filename));

        echo '<hr>';

        while(!feof($myfile)) {
            echo fgets($myfile) . "<br>";
        }
    
        fclose($myfile);
    }
    else{
        echo "plik nie istnieje";
    }
   
?>
