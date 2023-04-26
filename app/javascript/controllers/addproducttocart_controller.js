import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  connect() {
    console.log("boioioiol")
  }

  addproduct(event) {
    event.preventDefault();
    console.log("addproduct has been triggered")
    const url = "/line_items"
    const product_id = document.getElementsByClassName("button_to")[1].getAttribute("action").match(/\d+/)[0]

  }
}
