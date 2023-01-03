<?php
//  1, 2, 5, 10 

 

    function rozmien($num){

        echo "$num zł ";
        $coins= [0,0,0,0];
        while($num!=0)
        {
           if($num%10==0){
               $coins[3]++;

               $num-=10;

           }
           else if($num%5==0){
            $coins[2]++;

            $num-=5;

            }

            else if($num%2==0){
                $coins[1]++;
    
                $num-=2;
    
            }
            else if($num%1==0){
                $coins[0]++;
    
                $num-=1;
    
            }
           
        }
        
       echo "rozmieniono na <br> 
       $coins[3] *10zł <br/>
       $coins[2] *5zł <br/>
       $coins[1] *2zł <br/>
       $coins[0] *1zł <br/><hr/>";
    }
    
   

    rozmien(389);
    rozmien(35);
    rozmien(7);

    rozmien(87);
