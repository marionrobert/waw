import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["result", "title", "body"];

  connect() {
    console.log("Connected to the share controller");
  }

  async share(event) {
    alert("BLABLA")
    console.log("SHARE EVENT ICI")
    event.preventDefault();
    const shareData = {
      title: this.titleTarget.textContent,
      body: this.bodyTarget.textContent,
      url: this.data.get("urlValue")
    };
    try {
      await navigator.share(shareData);
      // pas grand intérêt
      // la ligne du dessous permet d'affiché une notice comme quoi le partage est effectué
      // this.resultTarget.textContent = "Partage effectué";
    } catch (err) {
      // pas grand intérêt
      this.resultTarget.textContent = `Erreur: ${err}`
    }
  }
}
