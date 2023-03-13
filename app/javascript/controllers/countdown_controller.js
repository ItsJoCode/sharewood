import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['days', 'hours', 'minutes', 'seconds']
  static values = {endtime: String}


  connect() {
    this.updateTimer()
    setInterval(() => this.updateTimer(), 1000)
  }

  updateTimer() {
    const time = this.countdown()
    this.daysTarget.innerHTML = time.days
    this.hoursTarget.innerHTML = time.hours
    this.minutesTarget.innerHTML = time.minutes
    this.secondsTarget.innerHTML = time.seconds
  }

  countdown() {
    const endTime = new Date(this.endtimeValue).getTime()
    const now = new Date().getTime()
    const timeLeft = endTime - now

    if (timeLeft > 0) {
      const days = this.formatTime(Math.floor(timeLeft / (1000 * 60 * 60 * 24)))
      const hours = this.formatTime(Math.floor((timeLeft / (1000 * 60 * 60)) % 24))
      const minutes = this.formatTime(Math.floor((timeLeft / 1000 / 60) % 60))
      const seconds = this.formatTime(Math.floor((timeLeft / 1000) % 60))

      return { days, hours, minutes, seconds }
    } else {
      return { days: '00', hours: '00', minutes: '00', seconds: '00' }
    }
  }

  formatTime(time) {
    return time < 10 ? `0${time}` : time
  }
}
