import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dataForm", "customizationForm", "openingHoursForm", "btnDataForm", "btnCustomizationForm", "btnOpeningHoursForm"]

  connect() {
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
