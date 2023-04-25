import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'list',
    'form',
    'title',
    "pages"
  ]
  connect(){
    // console.log("coucou from search controller")
    this.pagesTarget.style.visibility = "visible";
  }

  update(event) {
    if (!this.hasListTarget) return
    const data = new FormData(this.formTarget)
    const url = `/products/search`
    const options = {
      method: 'POST',
      body: data,
      headers: {'Accept': 'application/json'}
    }

    fetchWithToken(url, options)
      .then(response => response.json())
      .then((data) => {
        this.titleTarget.innerText = data.title
        this.listTarget.innerHTML = data.list
      });
    this.pagesTarget.style.visibility = "hidden";
  }

  displayMobileSearchInput() {
    const loupe = document.getElementById("mobile-magnifying-glass")
    const searchinput = document.getElementById("mobile-input-search")
    //const bodydark = document.getElementById("darken2")
    // bodydark.classList.add("darkenmenuopen")
    searchinput.classList.remove("responsivesearchbar")
    searchinput.classList.add("responsivesearchbaronclick")
    loupe.classList.add("mobile-magnifying-glass-masked")
  }

  hideMobileSearchInput() {
    const loupe = document.getElementById("mobile-magnifying-glass")
    const searchinput = document.getElementById("mobile-input-search")
    const closesearchinput = document.getElementById("close-search-input")
    // const bodydark = document.getElementById("darken2")
    // bodydark.classList.remove("darkenmenuopen")
    searchinput.classList.remove("responsivesearchbaronclick")
    searchinput.classList.add("responsivesearchbar")
    loupe.classList.remove("mobile-magnifying-glass-masked")
    // closesearchinput.classList.add("mobilemaskcrossinput")
  }
}
