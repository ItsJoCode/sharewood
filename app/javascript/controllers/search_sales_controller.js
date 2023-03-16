import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-sales"
export default class extends Controller {
  static targets = ["form", "input", "list", "fullmap", "cards", "changebtn"]

  connect() {
    this.changebtnTarget.innerHTML = 'Voir la carte <i class="fa-regular fa-map"></i>'
  }

  update() {
    console.log("update")
    const hmap = this.fullmapTarget.classList.contains("hiddenmap")
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
        if (!hmap) {
          this.cardsTarget.classList.add("d-none")
          this.fullmapTarget.classList.remove("hiddenmap")
          this.changebtnTarget.innerHTML = 'Voir les ventes <i class="fa-solid fa-list"></i>'
        } else {
          this.changebtnTarget.innerHTML = 'Voir la carte <i class="fa-regular fa-map"></i>'
        }
      })

  }

  display(event) {
    event.preventDefault()
    this.cardsTarget.classList.toggle("d-none")
    this.fullmapTarget.classList.toggle("hiddenmap")
    const hmap = this.fullmapTarget.classList.contains("hiddenmap")
    if (!hmap) {
      event.target.innerHTML = 'Voir les ventes <i class="fa-solid fa-list"></i>'
    } else {
      event.target.innerHTML = 'Voir la carte <i class="fa-regular fa-map"></i>'
    }
  }

}
