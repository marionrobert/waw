import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addproducttocart"
export default class extends Controller {
  static targets = [ "button" ]

  connect() {
    console.log("buuuuuu")
  }

  addproduct(event) {
    event.preventDefault();
    console.log("addproduct has been triggered")
    console.log(this.buttonTarget.innerHTML)
    console.log(this.buttonTarget.getAttribute('action'))

    // console.log(this.buttonTarget.getAttribute('action'));
    // on récupère ça
    // <form class="button_to" method="post" action="/line_items?product_id=10"><button class="btnaddproduct" type="submit">Ajouter au panier : 4,51 €</button><input type="hidden" name="authenticity_token" value="yVEVcDAzi4m7PDtpLx4XLdLhWkUDIgUZXm-NYJedqcn14rYdXJLzG5Bgz5YtGEUon3_x_oXG2km4ySzIeTTY4g" autocomplete="off"></form>
    // on veut récupérer ça : /line_items?product_id=10
    // console.log(this.buttonTarget.getAttribute('action')); --> porposé par chatgpt mais ça fonctionne pas

    // faire data-line-itemsproducit-id params ?
  }
}
