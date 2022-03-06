var pop1 = Array.from(document.getElementsByClassName("popup"))
for(let i = 0; i<pop1.length; i++){
    pop1[i].addEventListener("click", function(){
        var pop2 = document.getElementById(`myPopup${i}`);
        pop2.classList.toggle("show")
    })
}