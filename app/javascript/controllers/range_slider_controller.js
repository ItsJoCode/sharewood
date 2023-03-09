import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="range-slider"
export default class extends Controller {
  static targets = ["output", "input", "price", "weight"]
  static values = { price: Number, weight: Number }

  connect() {
    // this.updateOutput()
    console.log(this.priceValue)
    console.log(this.weightValue)
  }

  updateOutput() {
    this.outputTarget.textContent = Number.parseInt(this.inputTarget.value, 10);
    this.displayPrice()
    this.displayWeight()
  }

  onInput() {
    this.updateOutput()
  }

  displayPrice() {
    this.priceTarget.textContent = this.priceValue * this.outputTarget.textContent
  }

  displayWeight() {
    this.weightTarget.textContent = this.weightValue * this.outputTarget.textContent
  }
}
