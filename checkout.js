

let checkbtn = document.getElementById("Checkbtn")
var final_cost

checkbtn.addEventListener("click", function(){
    let promo = document.getElementById("promocode").value
    let total = document.getElementById("total").value
    let promo_actual = document.getElementById("promocode_actual").value
    console.log(promo_actual)
    if(promo === promo_actual){
        final_cost = total*0.75
        final_cost = parseInt(final_cost)
        document.getElementById("finalcost").innerHTML = "Yayyy!! Code applied- Your new total is Rs."+ final_cost;
        document.getElementById("total").value = final_cost
    }
    else{
        document.getElementById("finalcost").innerHTML = "Code Not Applicable"

    }
})