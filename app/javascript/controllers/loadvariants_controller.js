import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loadvariants"
export default class extends Controller {

  connect() {
    console.log("hi=ey")
    this.token = document.querySelector("meta[name=csrf-token]").content
  }

  loadNewVariant(event) {
    event.preventDefault();
    // console.log("load_new_variant has been triggered")
    console.log(event.params.productId)
    fetch(`/products/${evt.params.productId}`, {
      method: "GET",
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token },
      body: JSON.stringify({ page: window.location.pathname })
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })

  }
}
