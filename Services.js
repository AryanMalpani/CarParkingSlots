let Csprice = document.getElementById("Csprice")
let Arprice = document.getElementById("Arprice")
let Cwprice = document.getElementById("Cwprice")
let pp = document.querySelector(".pp")
let cost = 0
let tp = parseInt(pp.innerHTML)

let up = document.querySelector(".show")



var Csp = false;
var Arp = false
var Cwp = false
document.getElementById("Arp").value = Arp
document.getElementById("Cwp").value = Cwp
document.getElementById("Csp").value = Csp
document.getElementById("stotal").value = cost

Csprice.addEventListener("click", function(){
    
    if(Csp === false){
        Csp = true
        cost=cost+1000
        Csprice.classList.add("price-btn")
    }
    else if(Csp === true){
        Csp = false
        cost = cost-1000
        Csprice.classList.remove("price-btn")
    }
    document.getElementById("total1").innerHTML = `${cost}`;
    up.innerHTML = tp+cost
    document.getElementById("stotal").value = cost
    document.getElementById("Csp").value = Csp

})
Arprice.addEventListener("click", function(){
    
    if(Arp === false){
        Arp = true
        cost=cost+100
        Arprice.classList.add("price-btn")
    }
    else if(Arp === true){
        Arp = false
        cost = cost-100
        Arprice.classList.remove("price-btn")
    }
    
    document.getElementById("total1").innerHTML = `${cost}`;
    up.innerHTML = tp+cost
    document.getElementById("stotal").value = cost
    document.getElementById("Arp").value = Arp
    
})

Cwprice.addEventListener("click", function(){
    
    if(Cwp === false){
        Cwp = true
        cost=cost+200
        Cwprice.classList.add("price-btn")
        
    }
    else if(Cwp === true){
        Cwp = false
        cost = cost-200
        Cwprice.classList.remove("price-btn")
        
    }
    
    document.getElementById("total1").innerHTML = `${cost}`;
    up.innerHTML = tp+cost
    document.getElementById("stotal").value = cost
    document.getElementById("Cwp").value = Cwp
    
})