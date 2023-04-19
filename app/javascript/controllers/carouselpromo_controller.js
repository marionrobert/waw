import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carouselpromo"
export default class extends Controller {
  connect() {
    console.log("coucou from carouselpromo")
    }
}
