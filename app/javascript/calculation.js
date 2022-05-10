window.addEventListener('load',function(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const tax = 0.1

  itemPrice.addEventListener("keyup",()=>{
    const calcTaxPrice = Math.floor((itemPrice.value) * tax);
    const calcProfit = (itemPrice.value)-calcTaxPrice;
    addTaxPrice.innerHTML = `${calcTaxPrice}`
    profit.innerHTML = `${calcProfit}`
  });
});