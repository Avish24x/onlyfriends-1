import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {

  static targets = ["form", "start", "end", "totalPrice"]


  getPrice() {
    // console.log(this.startTarget.value)
    // console.log(this.endTarget.value)
    let start = this.startTarget.value
    let end = this.endTarget.value
    let startMili = Date.parse(start)
    let endMili = Date.parse(end)
    let hours = (endMili - startMili) / 3_600_000
    const price = parseFloat(document.getElementById("price").innerHTML)

    if (start && end) {
      this.totalPriceTarget.innerHTML = hours * price
    }
    else {
      this.totalPriceTarget.innerHTML = "0"
    }
  }

}
