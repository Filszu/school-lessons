<?php
    // if (file_exists($target_file)){

    // }

    $filename="files/dane";

    try{
        if (!file_exists($filename))
        {
            throw new Exception('File not found.');
        } 
    

       
        $myfile = fopen($filename, "r") or die("Unable to open file!");
        // echo fread($myfile,filesize($filename));

        echo '<hr>';

        while(!feof($myfile)) {
            echo fgets($myfile) . "<br>";
        }
    
        fclose($myfile);
    
  
    }catch(Exception $e){
        echo "plik nie istnieje";
    }
    
   
?>