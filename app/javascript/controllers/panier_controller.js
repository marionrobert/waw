import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {
  connect() {
  }

  updatePanier2() {
    const panierflottant = document.getElementById("panierflottant")
    const dark = document.getElementById("darken")
    panierflottant.classList.add("open")
    dark.classList.add("darkenmenuopen")
  }

  removePanier() {
    const panierflottant = document.getElementById("panierflottant")
    const dark= document.getElementById("darken")
    panierflottant.classList.remove("open")
    dark.classList.remove("darkenmenuopen")
  }
}
