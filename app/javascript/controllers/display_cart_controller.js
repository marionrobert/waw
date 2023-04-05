import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log("hello from display-cart controller")
  }

  showCart() {
    const panierflottant = document.getElementById("panierflottant")
    const dark = document.getElementById("darken")
    panierflottant.classList.add("open")
    dark.classList.add("darkenmenuopen")
  }

  closeCart() {
    const panierflottant = document.getElementById("panierflottant")
    const dark= document.getElementById("darken")
    panierflottant.classList.remove("open")
    dark.classList.remove("darkenmenuopen")
  }

  categoriesdisplay() {
    // const categoriesbutton = document.getElementById("categoriesdesktopbutton")
    const bandeaucat = document.getElementById("bandeau_categories")
    bandeaucat.classList.toggle("hidden")
    bandeaucat.classList.toggle("enable_on_desktop")

  }
}
