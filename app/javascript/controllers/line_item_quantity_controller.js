import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-item-quantity"
export default class extends Controller {
  connect() {
    console.log("hello yooouuuu")
    this.token = document.querySelector("meta[name=csrf-token]").content
  }

  addOne(event) {
    let formerQuantity = document.getElementById(`quantityItem${event.params.itemId}`)
    let amountCart = document.getElementById(`amountCart`)
    let totalOriginalPrice = document.getElementById(`totalOriginalPrice${event.params.itemId}`)
    let totalPromoPrice = document.getElementById(`totalPromoPrice${event.params.itemId}`)
    let totalPrice = document.getElementById(`totalPrice${event.params.itemId}`)
    let url = `/line_items/addone.${event.params.itemId}`

    fetch(url, {
      method: "POST",
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token }
    })
      .then(response => response.json())
      .then(data => {
        formerQuantity.innerText = data.quantity;
        amountCart.innerText = data.amount_cart / 100.00;
        totalOriginalPrice.innerText = data.price_original / 100.00;
        totalPromoPrice.innerText = data.price_promo / 100.00;
        totalPrice.innerText = data.final_price / 100.00;
        // add-remove class with keyframe effect
        formerQuantity.classList.add("afterchange")
        setTimeout(function() {
          formerQuantity.classList.remove("afterchange")
        }, 4000);
      });
  };

  delete(event){
    event.preventDefault();
    let amountCart = document.getElementById(`amountCart`)
    let lineItem = document.getElementById(`lineItem${event.params.itemId}`)

    if (confirm("Êtes-vous sûr de vouloir supprimer cet article de votre panier ?")) {
      let url = `/line_items/${event.params.itemId}`
      fetch(url, {
        method: "DELETE",
        headers: {
          "content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-TOKEN": this.token }
      })
      .then(response => response.json())
      .then(data => {
        lineItem.style.display = "none";
        amountCart.innerText = data.amount_cart / 100.00;
      });
    };
  }

  removeOne(event){
    event.preventDefault();
    let formerQuantity = document.getElementById(`quantityItem${event.params.itemId}`)
    let amountCart = document.getElementById(`amountCart`)
    let totalOriginalPrice = document.getElementById(`totalOriginalPrice${event.params.itemId}`)
    let totalPromoPrice = document.getElementById(`totalPromoPrice${event.params.itemId}`)
    let totalPrice = document.getElementById(`totalPrice${event.params.itemId}`)

    if (formerQuantity.innerText === "1") {
      this.delete(event);
    }
    else {
      let url = `/line_items/removeone.${event.params.itemId}`

      fetch(url, {
        method: "POST",
        headers: {
          "content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-TOKEN": this.token
        }
      })
        .then(response => response.json())
        .then(data => {
          formerQuantity.innerText = data.quantity;
          amountCart.innerText = data.amount_cart / 100.00;
          totalOriginalPrice.innerText = data.price_original / 100.00;
          totalPromoPrice.innerText = data.price_promo / 100.00;
          totalPrice.innerText = data.final_price / 100.00;
          // add-remove class with keyframe effect
          formerQuantity.classList.add("afterchange")
          setTimeout(function() {
            formerQuantity.classList.remove("afterchange")
          }, 4000);
        });
      }
  };


}
