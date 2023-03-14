import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["bar"];
  static values = { currentcapacity: Number, salecapacity: Number }

  // connect() {
  //   console.log(this.currentValue)
  //   console.log(this.capacityValue)
  //   this.width = 0;
  //   this.interval = setInterval(this.frame.bind(this), 10);
  // }

  // disconnect() {
  //   clearInterval(this.interval);
  // }

  // frame() {
  //   const value = this.currentValue// get the value from the data-value attribute
  //   const maxValue = this.capacityValue // get the maximum value from the data-max-value attribute
  //   const percentage = (value / maxValue) // calculate the percentage value
  //   if (this.width >= 100) {
  //     clearInterval(this.interval);
  //   } else {
  //     this.width = this.width + percentage;
  //     this.barTarget.style.width = this.width + "%";
  //     // this.barTarget.style.width = `${percentage}%`
  //   }
  // }

  connect() {
    this.updateProgressBar()
  }

  updateProgressBar() {
    const value = this.currentcapacityValue// get the value from the data-value attribute
    const maxValue = this.salecapacityValue // get the maximum value from the data-max-value attribute
    const percentage = (value / maxValue) * 100 // calculate the percentage value
    this.barTarget.style.width = `${percentage}%` // set the width of the progress bar
  }
}
