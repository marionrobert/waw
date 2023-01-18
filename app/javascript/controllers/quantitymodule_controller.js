import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quantitymodule"
export default class extends Controller {
  connect() {
    console.log("module de quantité connecté")
  }

}
