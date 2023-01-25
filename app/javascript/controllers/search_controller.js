import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'list',
    'form',
    'title'
  ]

  update(event) {
    if (!this.hasListTarget) return

    const data = new FormData(this.formTarget)
    const url = `/products/search`
    const options = {
      method: 'POST',
      body: data,
      headers: { 'Accept': 'application/json' }
    }

    fetchWithToken(url, options)
      .then(response => response.json())
      .then((data) => {
        this.titleTarget.innerText = data.title
        this.listTarget.innerHTML = data.list
      })
  }
}
