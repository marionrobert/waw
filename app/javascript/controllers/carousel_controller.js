import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  static values = { step: Number }

  connect() {
    this.stepValue = this.stepValue || this.contentTarget.clientWidth
  }

  prev() {
    this.contentTarget.scrollLeft -= this.stepValue
  }

  next() {
    this.contentTarget.scrollLeft += this.stepValue
  }

  auto() {
    setInterval(() => {
      this.contentTarget.scrollLeft += this.stepValue
    }, 1200)
  }
}
