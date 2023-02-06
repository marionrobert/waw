import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-item-quantity"
export default class extends Controller {
  connect() {
    console.log("Hello from line item quantity controller")
  }

  static targets = [ "quantity" ]

  addOne(event) {
    // event.preventDefault();
    console.log("add one clicked");
    let button = event.currentTarget;
    console.log(button);
    let url = button.getAttribute("href");
    let quantityTarget = this.quantityTarget;

    fetch(url, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      }
    })
      .then(response => response.json())
      .then(data => {
        quantityTarget.innerText = data.quantity;
      });
  }
}
