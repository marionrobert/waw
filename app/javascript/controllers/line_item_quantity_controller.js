import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-item-quantity"
export default class extends Controller {
  connect() {
    console.log("hooooo")
    this.token = document.querySelector("meta[name=csrf-token]").content
  }

  static targets = [ "quantity" ]

  addOne(event) {
    let quantityTarget = this.quantityTarget
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
        quantityTarget.innerText = data.quantity;
        // add-remove class with keyframe effect
        quantityTarget.classList.add("afterchange")
        setTimeout(function() {
          quantityTarget.classList.remove("afterchange")
        }, 4000);
      });
  }

  removeOne(event){
    let quantityTarget = this.quantityTarget
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
        quantityTarget.innerText = data.quantity;
        // add-remove class with keyframe effect
        quantityTarget.classList.add("afterchange")
        setTimeout(function() {
          quantityTarget.classList.remove("afterchange")
        }, 4000);
      });
  }
}
