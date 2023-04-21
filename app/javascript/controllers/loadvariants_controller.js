import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="loadvariants"
export default class extends Controller {
  static targets = ["discountpercentzone", "pricezone", "orientation", "height", "width", "support", "framequantity", "addtocart", "stockzone", "time", "promotionnalprice", "price", "endingDate"]

  connect() {
    this.startTimer();
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
          <h3 style="color:green;text-align:right"><b>Prix promo: ${data.promotionnal_price} € TTC</b></h3>
          <span style="display:none" data-loadvariants-target="endingDate">${data.discount_ending_date}</span>
          <p style="color:red;text-align:right;">Fin de la promotion dans <span data-loadvariants-target="time"></span></p>`
        } else {
          this.discountpercentzoneTarget.innerHTML = ""
          this.pricezoneTarget.innerHTML = `<h4><b>Prix : ${data.price} € TTC</b></h4>
          <span data-loadvariants-target="endingDate" style="display:none"></span>`
        }

        // update table zone
        this.orientationTarget.innerText = data.orientation
        this.heightTarget.innerText = data.height
        this.widthTarget.innerText = data.width
        this.supportTarget.innerText = data.support
        this.framequantityTarget.innerText = data.frame_quantity

        // update stock zone
        if ( data.stock_quantity > 0) {
          this.stockzoneTarget.innerHTML = `<p style="color:green;text-align:left"><strong>En stock :</strong>  ${data.stock_quantity} exemplaires disponibles</p>`
        } else {
          this.stockzoneTarget.innerHTML = `<p style="color:green;text-align:left"><i>Disponible sous ${data.supplier_delay} jours</i></p>`
        }

        // no display all the red arrows
        const all_arrows = document.getElementsByClassName("fa-arrow-right")
        const array_all_arrows = Object.values(all_arrows)
        array_all_arrows.forEach((element) => {
          element.style.display = "none"
        })

        // update variants' buttons style
        const all_variants = document.getElementsByClassName("variant")
        const array_all_variants = Object.values(all_variants)
        array_all_variants.forEach((element) => {
          if (element.id == event.params.productId ) {
            element.style.color = "white"
            element.style.background = "rgb(50, 50, 50)"
            element.style.boxShadow = "0px 2px 1px grey"
            element.style.borderRadius = "0"
            element.style.border = "none"
            element.innerHTML = `${data.height}x${data.width} - ${data.orientation} - ${data.support}`
          } else {
            element.style.color = "black"
            element.style.background = "rgb(236, 240, 241)"
            element.style.boxShadow = "0px 2px 1px grey"
            element.style.borderRadius = "0"
            element.style.border = "none"
          }
        });

        // update price in "addtocart" button
        if (data.discount_price_cents === 0) {
          this.addtocartTarget.innerHTML = `<form class="button_to" method="post" action="/line_items?product_id=${data.id}"><button class="btnaddproduct" type="submit">Ajouter au panier : ${data.price} € </button><input type="hidden" name="authenticity_token" value="TqR7J7iQcO8bM-9Phoc75WLMmNhlcC5eh3tr-kkGA3-PdGzGkrtA6rTepL9nqRG8hL03fhGdvdHqnIkb_ipm1g" autocomplete="off"></form>`
        } else {
          this.addtocartTarget.innerHTML = `<form class="button_to" method="post" action="/line_items?product_id=${data.id}"><button class="btnaddproduct" type="submit">Ajouter au panier : ${data.promotionnal_price} € </button><input type="hidden" name="authenticity_token" value="TqR7J7iQcO8bM-9Phoc75WLMmNhlcC5eh3tr-kkGA3-PdGzGkrtA6rTepL9nqRG8hL03fhGdvdHqnIkb_ipm1g" autocomplete="off"></form>`
        }
      })
  }

  get_remaining_time(){
    if (this.endingDateTarget.innerText.match(/^\d{4}-\d{2}-\d{2}$/)) {
      const today = new Date()
      const ending_date = new Date(this.endingDateTarget.innerText)
      const diffTime = Math.abs(ending_date - today)
      const diffSeconds = Math.floor(diffTime / 1000);
      if (diffSeconds < 172800) {
        let hours = Math.floor((diffTime / (1000 * 60 * 60)) % 24)
        if (hours < 10) {
          hours = `0${hours}`
        }
        let minutes = Math.floor((diffTime / 1000 / 60) % 60);
        if (minutes < 10) {
          minutes = `0${minutes}`
        }
        let seconds = Math.floor((diffTime  / 1000) % 60);
        if (seconds < 10) {
          seconds = `0${seconds}`
        }
        this.timeTarget.innerText = `${hours}h ${minutes}min ${seconds}s`
      } else {
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        this.timeTarget.innerText =`${diffDays} jours`
      }
    }
  }

  startTimer() {
    this.timer = setInterval(() => {
      this.get_remaining_time();
    }, 1000);
  }
}
