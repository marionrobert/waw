import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="panier"
export default class extends Controller {
  static targets = ['search'];

  connect() {

  }

  livesearch() {
    const searchzone = document.getElementById("search")
    let html = "<p> My new paragraph.</p>";
    searchzone.insertAdjacentHTML("afterend", html);
    // alert("i'm listening")
  }
}
