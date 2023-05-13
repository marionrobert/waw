import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mainproduct"
export default class extends Controller {
  connect() {
    // console.log("hello from mainproduct stimulus controller")
  }

  hideinput() {
    let photoInput = document.getElementById("main_product_only_has_photo");
    photoInput.classList.toggle("hidden");
  }
}
