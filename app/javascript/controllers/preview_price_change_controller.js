import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    // console.log("Hello from the previous price change controller!")

  }

  preview(event){
    let valueToPreview = event.target.value;
    // attention, si quelqu'un rajoute des class aux inputs concernés,
    // il faudra s'assurer que l'index de la class n'a pas changé
    let classNameofParagraph = event.target.classList[4];
    // console.log(classNameofParagraph);
    let paragraph = document.getElementById(classNameofParagraph)
    // console.log(paragraph);
    paragraph.innerText = `Prix en euros : ${valueToPreview/100}`
  }
}
