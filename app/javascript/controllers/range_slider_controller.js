import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="range-slider"
export default class extends Controller {
  static targets = [ "output", "input" ]

  connect() {
    this.updateOutput()
  }

  updateOutput() {
    this.outputTarget.textContent = this.inputTarget.value
  }

  onInput() {
    this.updateOutput()
  }
}
