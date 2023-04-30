import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {

  static targets = [ "contenupanier" ]

  connect() {
    console.log("ooo from addproducttocart")
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

      // console.log(data.total_cart)
      this.contenupanierTarget.innerHTML = "";

      data.products.forEach(product => {
        // console.log(product.name)
        let html_to_insert=`
        <div id="lineItem${product.id}">
          <div class="onelineitem">
            <div class="vignette-line-item">
              <img src=${product.image_source}>
            </div>

          <div class="line-item-central-area">

            <div class="line-item-info">
              <p class="line-item-product-name">${product.name}</p>
              <p class="line-item-sku">REF: ${product.sku}</p>
            </div>

            <div class="quantity-zone">
              <span class="quantity-icon" data-action="click->line-item-quantity#addOne" data-line-item-quantity-item-id-param="${product.id}">
                <i class="fa-solid fa-plus "></i>
              </span>
              <span style="margin:0 5%" id="quantityItem${product.id}">
                ${product.quantity}
              </span>
              <span class="quantity-icon" data-action="click->line-item-quantity#removeOne" data-line-item-quantity-item-id-param="${product.id}">
                <i class="fa-solid fa-minus"></i>
              </span>
            </div>

          </div>

          <div class="price-zone">
              <p class="price-off"><span id="totalOriginalPrice${product.id}">${product.original_price}</span> €</p>
              <span class="discount-percent">-${product.discount_percent}%</span>
              <p class="promo-price"><span id="totalPromoPrice${product.id}">${product.discount_price}</span> €</p>
              <span style="display:none" id="totalPrice${product.id}"></span>
          </div>

          <div class="trashzone">
            <span data-action="click->line-item-quantity#delete" data-line-item-quantity-item-id-param="${product.id}">
              <i class="fa-solid fa-trash-can" style="color:grey"></i>
            </span>
          </div>
        </div>

        <div class="line-item-separator"></div>
      </div>
      `
      console.log(html_to_insert)
      this.contenupanierTarget.insertAdjacentHTML('beforeend', html_to_insert);
      });
      let total_cart_amount = `<div class="subtotal-line">
      <div class="subtotal-txt">
        <p>SOUS-TOTAL TTC</p>
      </div>
      <div class="subtotal">
        <p>
          <span id="amountCart">${data.total_cart}</span> €
        </p>
      </div>
    </div>`
      console.log(total_cart_amount)
      this.contenupanierTarget.insertAdjacentHTML('beforeend', total_cart_amount);

    });
  }
}
