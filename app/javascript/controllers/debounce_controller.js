import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
        this.formTarget.requestSubmit()
      }, 500)
  }
}
