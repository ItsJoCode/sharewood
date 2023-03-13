import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="range-slider"
export default class extends Controller {
  static targets = ["output", "input", "price", "weight", "draw"]
  static values = { price: Number, weight: Number }

  connect() {
    // this.updateOutput()
    // console.log(this.priceValue)
    // console.log(this.weightValue)
  }

  updateOutput() {
    const sliderValue = Number.parseInt(this.inputTarget.value, 10);
    this.outputTarget.textContent = sliderValue;

    const draw = this.drawTarget;
    const circles = draw.querySelectorAll("i.fa-circle");
    circles.forEach((circle, index) => {
      if (index < sliderValue) {
        circle.classList.add("fa-solid");
        circle.classList.remove("fa-regular");
      } else {
        circle.classList.remove("fa-solid");
        circle.classList.add("fa-regular");
      }
    });

    this.displayPrice();
    this.displayWeight();
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
