import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.token = document.querySelector("meta[name=csrf-token]").content
  }

  fav(evt) {
    evt.preventDefault();
    fetch(`/products/${evt.params.productId}/favorites`, {
      method: "POST",
      headers: {
        "content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token },
      body: JSON.stringify({ page: window.location.pathname })
    })
      .then(response => response.json())
      .then((data) => {
        if (data.unfav) {
          if (data.page === "/favorites") {
            evt.target.closest('.container-index> div > div').remove();
          } else {
            evt.target.style.color = "black";
          }
        } else {
          evt.target.style.color = "red";
        }
      })
    }

  redirect() {
    window.location.replace("http://localhost:3000/users/sign_in");
  }

}
