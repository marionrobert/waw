import { Controller } from "@hotwired/stimulus"
import { Button } from "bootstrap"

// Connects to data-controller="loadvariants"
export default class extends Controller {
  static targets = ["discountpercentzone", "pricezone", "orientation", "height", "width", "support", "framequantity", "addtocart", "stockzone"]

  connect() {

    this.token = document.querySelector("meta[name=csrf-token]").content
  }

  loadNewVariant(event) {
    event.preventDefault();
    fetch(`/products/${event.params.productId}`, {
      method: "GET",
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      }
    })
      .then(response => response.json())
      .then((data) => {
        // update price and discount_percent zones
        if (data.discount_price_cents != 0) {
          this.discountpercentzoneTarget.innerHTML = `<span class="promospanshowproduct"> ${data.discount_percent}  %</span`
          this.pricezoneTarget.innerHTML = `<h4 style="text-decoration:line-through">Prix : ${data.price} € TTC</h4>
          <h3 style="color:green;text-align:right"><b>Prix promo: ${data.promotionnal_price} € TTC</b></h3>`
        } else {
          this.pricezoneTarget.innerHTML = `<h4><b>Prix : ${data.price} € TTC</b></h4>`
        }

        // update table zone
        this.orientationTarget.innerText = data.orientation
        this.heightTarget.innerText = data.height
        this.widthTarget.innerText = data.width
        this.supportTarget.innerText = data.support
        this.framequantityTarget.innerText = data.frame_quantity

        // update stock zone
        if ( data.stock_quantity > 0) {
          this.stockzoneTarget.innerHTML = `<p style="color:green;text-align:right"><strong>En stock</strong></p>
          <p><i>Quantité disponible: ${data.stock_quantity}</i></p>`
        } else {
          this.stockzoneTarget.innerHTML = `<p style="color:green;text-align:right"><i>Disponible sous ${data.supplier_delay} jours</i></p>`
        }

        // update button add to cart
        this.addtocartTarget.innerHTML = `<form class="button_to" method="post" action="/line_items?product_id=${data.id}"><button class="btn btn-success addtocart p-4" type="submit">Ajouter au panier</button><input type="hidden" name="authenticity_token" value="TqR7J7iQcO8bM-9Phoc75WLMmNhlcC5eh3tr-kkGA3-PdGzGkrtA6rTepL9nqRG8hL03fhGdvdHqnIkb_ipm1g" autocomplete="off"></form>`
      })
  }
}
