import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  connect() {
    console.log("ioioioioio")
  }

  addproduct(event) {
    event.preventDefault();
    console.log("addproduct has been triggered")
    const url = "/line_items/new"
    const product_id = document.getElementsByClassName("button_to")[1].getAttribute("action").match(/product_id=\d+/)[0]
    console.log(product_id)

    const options = {
      method: 'POST',
      body: product_id,
      headers: {'Accept': 'application/json'}
    }

    fetchWithToken(url, options)
      .then(response => response.json())
      .then((data) => {
        console.log("ok")
      });

  // ajouter un numéro au panier
  }
}
