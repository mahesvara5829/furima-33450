window.addEventListener('load', function(){

  const costinput = document.getElementById("item-price")
  const costtax = document.getElementById("add-tax-price")
  const costprofit = document.getElementById("profit")
  
  costinput.addEventListener("keyup", () => {
    const price = costinput.value
    const tax = 0.1;
    const pricetax = price * tax
    costtax.innerHTML = Math.floor(pricetax);
    costprofit.innerHTML = price - Math.floor(pricetax);
  });
})




