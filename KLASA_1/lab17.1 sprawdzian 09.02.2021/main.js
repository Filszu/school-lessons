
var nr=1;




function next(){
    
    var box =  document.getElementById("imgAuto");

    nr++;

    
  box.innerHTML = '<img id="imgAuto" alt="box" src="img/'+nr+'.webp">';
    
}



function back(){
    
    var box =  document.getElementById("imgAuto");

    nr--;

    
  box.innerHTML = '<img id="imgAuto" alt="box" src="img/'+nr+'.webp">';
    
}