import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["title", "body"];

  connect() {
  }

  async share(event) {
    event.preventDefault();
    const shareData = {
      title: this.titleTarget.textContent,
      body: this.bodyTarget.textContent,
      url: this.data.get("urlValue")
    };
    try {
      await navigator.share(shareData);
    } catch (err) {
      // console.log(`Erreur: ${err}`)
    }
  }
}
