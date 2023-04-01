import { Controller } from "@hotwired/stimulus"
import { Button } from "bootstrap"

// Connects to data-controller="loadvariants"
export default class extends Controller {
  static targets = ["discountpercentzone", "pricezone", "orientation", "height", "width", "support", "framequantity", "addtocart", "stockzone"]

  connect() {
    console.log("hello")
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
            element.innerHTML = `${data.height}x${data.width} - ${data.orientation} - ${data.support}`
          }
        });

      })
  }
}



// othervariants zone
// {
//             <%if @similar_products.count.positive?%>
//               <% @similar_products.each do |product|%>
//                   <% if @product.sku== product.sku %>
//                     <button class="btn mb-2"
//                             style="background:rgba(236, 240, 241, 0.2); color:black; border:1px solid black"
//                             data-action="click->loadvariants#loadNewVariant"
//                             data-loadvariants-product-id-param="<%= product.id %>">
//                       <i class="fa-solid fa-arrow-right" style="color:red"></i>
//                       <%= product.height%>x<%= product.width%> - <%= product.orientation%> - <%= product.support%>
//                     </button>
//                   <% else %>
//                     <button class="btn btn-dark mb-2" data-action="click->loadvariants#loadNewVariant" data-loadvariants-product-id-param="<%= product.id %>">
//                       <%= product.height%>x<%= product.width%> - <%= product.orientation%> - <%= product.support%>
//                     </button>
//                   <% end %>
//               <% end %>
//             <% end %> */}
