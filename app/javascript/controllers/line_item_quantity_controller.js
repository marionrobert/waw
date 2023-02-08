import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-item-quantity"
export default class extends Controller {
  connect() {
    console.log("hellooooooo")
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
        console.log(data)
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

  removeOne(event){
    let formerQuantity = document.getElementById(`quantityItem${event.params.itemId}`)
    let amountCart = document.getElementById(`amountCart`)
    let totalOriginalPrice = document.getElementById(`totalOriginalPrice${event.params.itemId}`)
    let totalPromoPrice = document.getElementById(`totalPromoPrice${event.params.itemId}`)
    let totalPrice = document.getElementById(`totalPrice${event.params.itemId}`)
    let url = `/line_items/removeone.${event.params.itemId}`

    fetch(url, {
      method: "POST",
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token }
    })
      .then(response => response.json())
      .then(data => {
        console.log(data)
        let new_price_original = (data.price_original) / 100.00
        console.log(new_price_original)
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
}
