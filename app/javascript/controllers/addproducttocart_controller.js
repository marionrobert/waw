import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  static targets = [
    "contenupanier"
  ]


  connect() {
    console.log("helloooooooo from addproducttocart")
    console.log(this.contenupanierTarget)
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
      console.log(data.line_items);
      circle_items_count.classList.remove("hidden");
      circle_items_count.classList.add("visible");
      circle_items_count.classList.add("cartflash");
      circle_items_count.innerText = `${items_nb + 1}`;
      setTimeout(() => {
        circle_items_count.classList.remove("cartflash");
      }, 1500);
    });
  }


  //en data target, je veux récupérer, le nom du produit, le sku, le prix sans promo, le % de discount, le prix promo
  // s'il existe déjà en line_items, le même sku : alors onf ait juste +1 en quantité, +prix_unitaire (promo et original)


}
