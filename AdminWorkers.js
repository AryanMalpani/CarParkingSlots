var pop1 = Array.from(document.getElementsByClassName("popup"))
for(let i = 0; i<pop1.length; i++){
    pop1[i].addEventListener("click", function(){
        var pop2 = document.getElementById(`myPopup${i}`);
        pop2.classList.toggle("show")
 
    })
}

        // if(pop2 = null){
        //     // var pop2= i
        //     i++
        //     pop3 = document.getElementById(`myPopup${i+1}`);
        //     pop3.classList.toggle("show")
            
        // }
        // else{
        //     pop2.classList.toggle("show")
 
        // }
        // console.log(i)
        

var add1 = document.getElementById("add1")
        let div1 = document.querySelector(".loc1")
        
        add1.addEventListener("click", function(){
            
            div1.classList.remove("loc1")
            
        })