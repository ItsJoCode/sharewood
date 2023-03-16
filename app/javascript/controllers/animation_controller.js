import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  static targets = ["card", "slidebar", "table", "countdownsale"];

  connect() {
    setTimeout(() => this.showCard(), 300);
  }

  showCard() {
    this.cardTarget.classList.remove("hidden");
    this.cardTarget.classList.add("visible");
    setTimeout(() => this.showSlidebar(), 300);
  }

  showTable() {
    this.tableTarget.classList.remove("hidden");
    this.tableTarget.classList.add("visible");
  }

  showSlidebar() {
    this.slidebarTarget.classList.remove("hidden");
    this.slidebarTarget.classList.add("visible");
    setTimeout(() => this.showCountdown(), 300);
  }


  showCountdown() {
    this.countdownsaleTarget.classList.remove("hidden");
    this.countdownsaleTarget.classList.add("visible");
    setTimeout(() => this.showTable(), 300);
  }
}
