import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="loadvariants"
export default class extends Controller {
  static targets = ["discountpercentzone", "pricezone", "orientation", "height", "width", "support", "framequantity", "addtocart", "stockzone", "time", "promotionnalprice", "price"]

  connect() {
    console.log("ev")
    this.get_remaining_time()
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
        // console.log(data)

        // update price and discount_percent zones
        if (data.discount_price_cents != 0) {
          this.discountpercentzoneTarget.innerHTML = `<span class="promospanshowproduct"> ${data.discount_percent}  %</span`
          this.pricezoneTarget.innerHTML = `<h4 style="text-decoration:line-through">Prix : ${data.price} € TTC</h4>
          <h3 style="color:green;text-align:right"><b>Prix promo: ${data.promotionnal_price} € TTC</b></h3>
          <p style="color:red;font-weight:bolder;text-align:right;">Fin de la promotion dans <span data-loadvariants-target="time">${data.discount_ending_date}</span></p>`
          this.get_remaining_time()
        } else {
          this.pricezoneTarget.innerHTML = `<h4><b>Prix : ${data.price} € TTC</b></h4>
          <span data-loadvariants-target="time" style="display:none"></span>`
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


        // update buttons color
        let all_variants = document.getElementsByClassName("variant")
        const array_all_variants = Object.values(all_variants)
        array_all_variants.forEach((element) => {
          if (element.id == event.params.productId ) {
            element.style.color = "black"
            element.style.background = "rgba(236, 240, 241, 0.2)"
            element.style.border = "1px solid black"
            element.innerHTML = `<i class="fa-solid fa-arrow-right" style="color:red"></i> ${data.height}x${data.width} - ${data.orientation} - ${data.support}`
          } else {
            element.style.color = ""
            element.style.background = ""
            element.style.border = ""
          }
        });

      })
  }

  get_remaining_time(){
    console.log(this.timeTarget)
    if (this.timeTarget.innerText.match(/^\d{4}-\d{2}-\d{2}$/)) {
      console.log("il y a une promo")
      const today = new Date()
      const ending_date = new Date(this.timeTarget.innerText)
      const diffTime = Math.abs(ending_date - today);
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      console.log(diffTime + " milliseconds");
      let remaining_time = 0
          if (diffTime < (86400000*2)) {
            console.log("il reste moins de 48h de promo")
            this.timeTarget.innerText = "moins de 48h"
          } else {
            this.timeTarget.innerText =`${diffDays} jours`
          }
    } else {
      console.log("il n'y a pas de promo")
    }
  }
}
