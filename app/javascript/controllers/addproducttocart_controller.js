import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  static targets = [ "contenupanier" ]

  connect() {
    console.log("lll from addproducttocart")
  }

  addproduct(event) {
    event.preventDefault();
    const url = "/line_items"
    const product_id = document.querySelector("span#addproducttocartbutton form.button_to").getAttribute("action").match(/\d+/)[0]
    const circle_items_count = document.querySelector(".circle_items_count")
    const items_nb = Number(circle_items_count.innerText)

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
      circle_items_count.classList.remove("hidden");
      circle_items_count.classList.add("visible");
      circle_items_count.classList.add("cartflash");
      circle_items_count.innerText = `${items_nb + 1}`;
      setTimeout(() => {
        circle_items_count.classList.remove("cartflash");
      }, 1500);

      console.log(data.total_cart)

      data.products.forEach(product => {
        console.log(product);
      });
    });
  }
}
