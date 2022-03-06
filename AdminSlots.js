var select = document.getElementById("cars1")
var button = document.getElementById("submit-button")
 
button.addEventListener("click", function(){
    var value = select.options[select.selectedIndex].value;
    if(value === "T1"){
        document.getElementById("tablediv1").classList.remove("hide1")
        document.getElementById("tablediv2").classList.add("hide2")
        document.getElementById("tablediv3").classList.add("hide3")
        document.getElementById("tablediv4").classList.add("hide4")
        
 
    }
    else if(value === "T2"){
        document.getElementById("tablediv1").classList.add("hide1")
        document.getElementById("tablediv2").classList.remove("hide2")
        document.getElementById("tablediv3").classList.add("hide3")
        document.getElementById("tablediv4").classList.add("hide4")
 
    }
    else if(value === "T3"){
        document.getElementById("tablediv1").classList.add("hide1")
        document.getElementById("tablediv2").classList.add("hide2")
        document.getElementById("tablediv3").classList.remove("hide3")
        document.getElementById("tablediv4").classList.add("hide4")
 
    }
    else if(value === "T4"){
        document.getElementById("tablediv1").classList.add("hide1")
        document.getElementById("tablediv2").classList.add("hide2")
        document.getElementById("tablediv3").classList.add("hide3")
        document.getElementById("tablediv4").classList.remove("hide4")
 
    }
})
 
 
// var pop = document.getElementById("popup")
 
 
// pop.addEventListener("click", function(){
//     var popup = document.getElementById("myPopup");
//     popup.classList.toggle("show");
 
// })
let count = 0;
 
var pop1 = Array.from(document.getElementsByClassName("popup"))
for(let i = 0; i<pop1.length; i++){
    pop1[i].addEventListener("click", function(){
        var pop2 = document.getElementById(`myPopup${i}`);
        pop2.classList.toggle("show")
    
        
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
        
 
    })
}
// pop1.forEach((element, i) => {
//     pop1[i].addEventListener("click", function(){
//         console.log(i)
//         var pop2 = document.getElementById(`myPopup${i}`);
//         pop2.classList.toggle("show")
 
//     })
    
// });

var add1 = document.getElementById("add1")
let div1 = document.querySelector(".loc1")

add1.addEventListener("click", function(){
    
    div1.classList.remove("loc1")
    
})

var add2 = document.getElementById("add2")
let div2 = document.querySelector(".loc2")

add2.addEventListener("click", function(){
    
    div2.classList.remove("loc2")
    
})

var add3 = document.getElementById("add3")
let div3 = document.querySelector(".loc3")

add3.addEventListener("click", function(){
    
    div3.classList.remove("loc3")
    
})

var add4 = document.getElementById("add4")
let div4 = document.querySelector(".loc4")

add4.addEventListener("click", function(){
    
    div4.classList.remove("loc4")

})