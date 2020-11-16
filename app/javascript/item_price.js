window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1) 
    profitDom.innerHTML = Math.floor(inputValue * 0.9) 
  });
});

// window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
//   const addTaxDom = document.getElementById("add-tax-price");
//   const profitDom = document.getElementById("profit");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//      const taxvalue = Math.floor(inputValue * 0.1) ;
//     //  const profitvalue = Math.floor(inputValue * 0.9) 
//      const tax = taxvalue.toLocaleString() ;
//      console.log(taxvalue)
//     addTaxDom.innerHTML = tax;
//     // profitDom.innerHTML
//   });
// });
