import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("oaoaoaoaoao")
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
    this.undisplay_chose_connexion_window();
    this.undisplay_connexion_window();
  }

    // à ranger dans category_controller
  categoriesdisplay() {
    const bandeaucat = document.getElementById("bandeau_categories");
    bandeaucat.classList.remove("hidden");
    bandeaucat.classList.add("enable_on_desktop");

    // Ajout de l'écouteur d'événements
    bandeaucat.addEventListener("mouseleave", function() {
      bandeaucat.classList.remove("enable_on_desktop");
      bandeaucat.classList.add("hidden");
    });
  }

  display_chose_connexion_window () {
    const connexioncartbutton = document.getElementById("connexioncartbutton");
    connexioncartbutton.classList.add("open");
  }

  undisplay_chose_connexion_window () {
    const connexioncartbutton = document.getElementById("connexioncartbutton");
    connexioncartbutton.classList.remove("open");
  }

  display_connexion_window(){
    const signin_or_create_account_buttons = document.getElementById("signin_or_create_account_buttons");
    signin_or_create_account_buttons.classList.add("open");
  }

  undisplay_connexion_window(){
    const signin_or_create_account_buttons = document.getElementById("signin_or_create_account_buttons");
    signin_or_create_account_buttons.classList.remove("open");
  }

  continue_as_guest(event){
    event.preventDefault();
    console.log("sign_in_as_guest has been triggered")
    const user_icon = document.getElementsByClassName("profilebutton")[0]
    // console.log(user_icon.innerHTML)

    const url = '/login_as_guest'
    const options = {
      method: "POST",
      headers: {'Accept': 'application/json'}
    }

    fetchWithToken(url, options)
      .then(response => response.json())
      .then((data) => {
        console.log('ok')
        user_icon.innerHTML = "<i class='fa-solid fa-user-secret', style='color:green; font-size: 2.6vh;'></i>"
        this.display_chose_connexion_window();
      });
  }

  chose_sign_in_or_create_account(event){
    event.preventDefault();
    console.log("sign_in_or_create_account has been triggered")
    this.undisplay_chose_connexion_window();
    this.display_connexion_window();

  }

  sign_in(event){
    event.preventDefault();
    console.log("sign_in has been triggered")
    console.log(document.getElementById("email").innerText)
    console.log(document.getElementById("password").innerText)
  }

}
