


const playerQ = 8; //ilość graczy

let roundsQ= playerQ-1; 

players = ["player1", "player2", "player3", "player4"]


draw_area="";
players_left=playerQ;
// ------------
window.onload = print_area()



function print_area()
{
    
    area = document.querySelector(".container1");
    // area = document.querySelectorAll('.conatiner')[1];
 
    area.innerHTML="";

    let i;
    // for (i=0; i<roundsQ; i++){
    for (i=roundsQ; i>0; i--){

        // draw_area+=`<div class="round">aa</div>`;
        draw_area+=`<div class="round">`


        for(let j=0; j<players_left; j++){

            // draw_area+=`<div class="player">PLAYER_${j},runda${i}</div>`

            draw_area+=`<div class="player">PLAYER_${j}</div>`
        }

        draw_area += `</div>`;

        players_left=players_left/2;

        
    }
    

    area.innerHTML=draw_area;

}