import { Controller } from "@hotwired/stimulus"
import QrScanner from "qr-scanner"
import { Modal } from "bootstrap"
// Connects to data-controller="qr-code"
export default class extends Controller {
  static targets = ["scan", "input", "modal"]


  connect() {
    this.modal = new Modal(this.modalTarget)
    this.modalTarget.addEventListener('hidden.bs.modal', () => {
      this.stopScan()
    })
  }
  showScan() {
    this.qrScanner = new QrScanner(
      this.scanTarget,
      result => this.search(result),
      { /* your options or returnDetailedScanResult: true if you're not specifying any other options */ },
    );
    this.qrScanner.start().then(() => {
      this.scanTarget.classList.add("w-100")
    })
    // this.qrScanner.start().then(()=> {
    //   console.log("test")
    //   //this.scanTarget.insertBefore(this.qrScanner.$canvas, this.scanTarget)
    // })
  }
  search(result) {
    console.log(result)
    this.inputTarget.value = result.data
    this.inputTarget.dispatchEvent(new Event('input', {'bubbles': true}))
    this.modal.hide()
    this.stopScan()
  }
  stopScan() {
    this.qrScanner.stop()
  }
}
