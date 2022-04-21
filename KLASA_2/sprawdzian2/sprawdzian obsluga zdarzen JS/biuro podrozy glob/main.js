


const select1 = document.querySelector("#img_select");
const img = document.querySelector("#picture");


select1.addEventListener('change', function() {  //change
    
    // info.innerHTML = select1.value;
    file_name=select1.value;
    // // console.log(file_name);

    // info.innerHTML='<img src="'+file_name+'.jpg"alt="'+file_name+'"/>';

    img.innerHTML=`<a href="${file_name}.html"> <img src="${file_name}.jpg" alt="${file_name}"></a>`;
    
    
    
});

const imgs = ["lato", "zima", "lastMinute"]
let showImg = 0;
function changeImg(arg){

    console.log(showImg);
    if(showImg<imgs.length-1){
        if(arg==1){
            showImg++;
        
        }
        else{
            
            showImg==0?showImg=0:showImg--;
        }

        
    }
    else{
        showImg = 0;
    }

    console.log(showImg);
    file_name=imgs[showImg];
    img.innerHTML=`<a href="${file_name}.html"> <img src="${file_name}.jpg" alt="${file_name}"></a>`;
    select1.value=file_name;

}


function changeBG(mode){
    const body = document.querySelector("body");
    // body.style.backgroundColor="#001120";
    // body.style.color="#a55";
    if(mode==0){
        
        body.style.backgroundColor="#001120";
        body.style.color="#a55";
    }
    else if(mode==1){

        body.style.backgroundColor="white";
        body.style.color="black";
    }    
}


function copyright(){
    alert("Nie można kopiować i wykorzystywać materialów umieszczonych na stronie, bez zgody autora.")
}