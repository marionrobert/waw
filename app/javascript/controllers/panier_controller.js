import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {
  connect() {
  }
  updatePanier() {
    this.element.classList.toggle("open")
  }
  updatePanier2() {
    // alert("PANIER CLICK OK");
    const panierflottant = document.getElementById("panierflottant")
    panierflottant.classList.toggle("open")
  }
}
