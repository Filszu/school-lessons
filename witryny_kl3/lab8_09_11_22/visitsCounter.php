<?php


    $visits=0;
    $fileName = "files/visits";
    if(!isset($reset)){
        
        if(!file_exists($fileName)){
            echo "Jestes pierwszym użytkownikiem";
            // $visits = 0;
        }
        else{
            $myfile = fopen($fileName, "r") or die("Unable to open file!");
            $visits= fread($myfile,filesize($fileName));
            fclose($myfile);


        }
    }
    else{
        saveVisits($fileName,0);
        header('Location: ?');
        exit();
    }

    $visits++;
    // echo $visits;
    saveVisits($fileName,$visits);
    

    function saveVisits($fileName,$data){
        $myfile = fopen($fileName, "w") or die("Unable to open file!");
        fwrite($myfile, $data);
        fclose($myfile);
    }

?>