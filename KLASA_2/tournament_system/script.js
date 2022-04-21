const playersQ = 8; //ilość graczy

// total = Players-1
let total_roundsQ= playersQ-1; //eg.: [there is 8 players] in q-finals - 4rounds + s-fin -2 etc. 

let roundsQ = Math.log2(playersQ);// eg.: Q-finals, S-finals, finals, without-winner


players = ["player1", "player2", "player3", "player4"]


draw_area="";
players_left=playersQ;
// ------------
window.onload = print_area()



function print_area()
{
    
    area = document.querySelector(".container1");
    // area = document.querySelectorAll('.conatiner')[1];
 
    area.innerHTML="";

    let i;
    // for (i=0; i<roundsQ; i++){
    for (i=roundsQ+1; i>0 ; i--){

        if(players_left>=0){
            console.log("round: "+i)

            // draw_area+=`<div class="round">aa</div>`;
            draw_area+=`<div class="round">`


            for(let j=0; j<players_left; j++){

                // draw_area+=`<div class="player">PLAYER_${j},runda${i}</div>`

                // draw_area+=`<div class="player_box">PLAYER_${j}</div>`;

                draw_area+=`<div class="player_box">
                <div class="player_name">PLAYER_${j}</div>
                <div class="player_points"><p>0</p></div>
                </div>`;
                
                
                
            }

            draw_area += `</div>`;

            players_left=players_left/2;
            console.log("players_left: "+ players_left)
        }
        else{
            alert("0")
        }
        

        
    }
    

    area.innerHTML=draw_area;

}




//-info box
const cat_info = document.querySelector(".category_tournament_info");

cat_info.innerHTML=`
        number of players: ${playersQ}<br>
        total rounds quantity: ${total_roundsQ}<br>
        n rounds: ${roundsQ} ------------------ (eg.: Q-finals, S-finals, finals is equals 3) <br>
`;
