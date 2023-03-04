import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dataForm", "customizationForm", "openingHoursForm", "btnDataForm", "btnCustomizationForm", "btnOpeningHoursForm"]

  connect() {
    console.log("test avec targets pour les btns")
    // console.log(this.dataFormTarget)
    // console.log(this.customizationFormTarget)
    // console.log(this.openingHoursFormTarget)
    console.log(this.btnDataFormTarget)
    console.log(this.btnCustomizationFormTarget)
    console.log(this.btnOpeningHoursFormTarget)
  }

  display_form_shop_data() {

    this.customizationFormTarget.classList.add("hidden")
    this.openingHoursFormTarget.classList.add("hidden")
    this.dataFormTarget.classList.remove("hidden")

    this.btnOpeningHoursFormTarget.classList.remove("underline")
    this.btnCustomizationFormTarget.classList.remove("underline")
    this.btnDataFormTarget.classList.add("underline")

  }

  display_form_customization_and_adv(){

    this.dataFormTarget.classList.add("hidden")
    this.openingHoursFormTarget.classList.add("hidden")
    this.customizationFormTarget.classList.remove("hidden")

    this.btnDataFormTarget.classList.remove("underline")
    this.btnOpeningHoursFormTarget.classList.remove("underline")
    this.btnCustomizationFormTarget.classList.add("underline")

  }

  display_form_opening_hours(){

    this.openingHoursFormTarget.classList.remove("hidden")
    this.customizationFormTarget.classList.add("hidden")
    this.dataFormTarget.classList.add("hidden")

    this.btnDataFormTarget.classList.remove("underline")
    this.btnCustomizationFormTarget.classList.remove("underline")
    this.btnOpeningHoursFormTarget.classList.add("underline")
  }
}
