import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

export default class extends Controller {

  static targets = [ "allframes" ]


  connect() {
    // Stocke une référence au contrôleur
    this.controller = this
  }

  scroll_left() {
    const tableau = this.element.querySelector('#tableau-slider');
    let Y;
    if (tableau.dataset.value === "1" || tableau.dataset.value === "null") {
      Y = 450;
    } else if (tableau.dataset.value === "2") {
      Y = 675;
    }
    let X = window.innerWidth + Y;
    let frames = document.getElementById("tableau-slider");

    console.log(X);
    console.log(Y);
    console.log("SCROLL FRAME LEFT");

    frames.scrollBy(-X, 0); // défilement de X pixels vers la gauche
  }


  scroll_right() {
    const tableau = this.element.querySelector('#tableau-slider');
    let Y;
    if (tableau.dataset.value === "1" || tableau.dataset.value === "null") {
      Y = 450;
    } else if (tableau.dataset.value === "2") {
      Y = 675;
    }
    let X = window.innerWidth + Y;
    let frames = document.getElementById("tableau-slider");

    console.log(X);
    console.log(Y);
    console.log("SCROLL FRAME LEFT");

    frames.scrollBy(X, 0); // défilement de X pixels vers la droite
  }

  bigger_frame() {
    const tableau = document.getElementById('tableau-slider');
    tableau.setAttribute('data-value', '2');
    let tableaux = document.getElementsByClassName('allframes')
    console.log(tableaux)
    // tableaux.forEach(element => {
    //   element.classList.remove("tableau_60x90_paysage")
    //   element.classList.add("tableau_90x120_paysage")
    // });
  }

  shrink_frame() {
    const tableau = document.getElementById('tableau-slider');
    tableau.setAttribute('data-value', '1');
    let tableaux = document.getElementsByClassName('allframes')
    console.log(tableaux)
    // tableaux.forEach(element => {
    //   element.classList.add("tableau_60x90_paysage")
    //   element.classList.remove("tableau_90x120_paysage")
    // });
  }
}
