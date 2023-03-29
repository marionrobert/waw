import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sku", "width", "height", "orientation", "support", "name"]

  connect(){
  }

  nameautocomplete() {
    this.nameTarget.value = `${this.skuTarget.value}_${this.widthTarget.value}x${this.heightTarget.value}_${this.orientationTarget.value}_${this.supportTarget.value}`
  }
}
