import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  btnshopdata() {
    const btnshopdata = document.getElementById("btn_shop_data")
    const btnshopperso = document.getElementById("btn_shop_personnalisation")
    const btnshopopening = document.getElementById("btn_shop_opening_hours")

    const datashop = document.getElementById("shop_data_form")
    const shopperso = document.getElementById("shop_personnalisation_form")
    const shopopening = document.getElementById("shop_opening_hours")

    shopperso.classList.add("hidden")
    shopopening.classList.add("hidden")
    datashop.classList.remove("hidden")

    btnshopopening.classList.remove("underline")
    btnshopperso.classList.remove("underline")
    btnshopdata.classList.add("underline")

  }

  btnshopperso(){
    const btnshopdata = document.getElementById("btn_shop_data")
    const btnshopperso = document.getElementById("btn_shop_personnalisation")
    const btnshopopening = document.getElementById("btn_shop_opening_hours")

    const datashop = document.getElementById("shop_data_form")
    const shopperso = document.getElementById("shop_personnalisation_form")
    const shopopening = document.getElementById("shop_opening_hours")

    datashop.classList.add("hidden")
    shopopening.classList.add("hidden")
    shopperso.classList.remove("hidden")

    btnshopdata.classList.remove("underline")
    btnshopopening.classList.remove("underline")
    btnshopperso.classList.add("underline")

  }

  btnshopopening(){
    const btnshopdata = document.getElementById("btn_shop_data")
    const btnshopperso = document.getElementById("btn_shop_personnalisation")
    const btnshopopening = document.getElementById("btn_shop_opening_hours")

    const datashop = document.getElementById("shop_data_form")
    const shopperso = document.getElementById("shop_personnalisation_form")
    const shopopening = document.getElementById("shop_opening_hours")

    shopopening.classList.remove("hidden")
    shopperso.classList.add("hidden")
    datashop.classList.add("hidden")

    btnshopdata.classList.remove("underline")
    btnshopperso.classList.remove("underline")
    btnshopopening.classList.add("underline")
  }
}
