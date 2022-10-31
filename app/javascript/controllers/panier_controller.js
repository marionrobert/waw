import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {
  connect() {
  }
  updatePanier() {
    this.element.classList.toggle("open")
  }
  // updatePanier() {
  //   const test = document.querySelector("menupanier")
  //   test.classList.toggle("open")
  // }
}
