import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  connect() {
    console.log("yesssss")
  }

  addproduct(event) {
    event.preventDefault();
    console.log("addproduct has been triggered")
    const url = "/line_items"
    const product_id = document.querySelector("span#addproducttocartbutton form.button_to").getAttribute("action").match(/\d+/)[0]

    const options = {
      method: 'POST',
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ product_id: product_id })
    }

    fetchWithToken(url, options)
      .then(response => response.json())
      .then((data) => {
      });

  }
}
