import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'list',
    'form',
    'title',
    "pages",
    "pagynavdiv",
    "pagynavdivbis",
    "filterForm",
    "sortForm"
  ]
  connect(){
    console.log("aaa")
    if (!this.haspagesTarget) return
    this.pagesTarget.style.display = "block";
    this.pagynavdivTarget.style.display = "block";
    this.pagynavdivbisTarget.style.display = "block";
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
      this.pagesTarget.style.display = "none";
      this.pagynavdivTarget.style.display = "none";
      this.pagynavdivbisTarget.style.display = "none";
  }

  filterBySubCatAndOrientation(event) {
    console.log("hello from filterBySubCatAndOrientation")
    event.preventDefault();
    const data = new FormData(this.filterFormTarget)
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
    this.pagesTarget.style.display = "none";
    this.pagynavdivTarget.style.display = "none";
    this.pagynavdivbisTarget.style.display = "none";
  }

  sortByAscOrDescOrder(event){
    console.log("hello from sortByAscOrDescOrder")
    event.preventDefault();
    const data = new FormData(this.sortFormTarget)
    console.log()
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
    // const closesearchinput = document.getElementById("close-search-input")
    // const bodydark = document.getElementById("darken2")
    // bodydark.classList.remove("darkenmenuopen")
    searchinput.classList.remove("responsivesearchbaronclick")
    searchinput.classList.add("responsivesearchbar")
    loupe.classList.remove("mobile-magnifying-glass-masked")
    // closesearchinput.classList.add("mobilemaskcrossinput")
  }
}
