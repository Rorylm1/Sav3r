import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["side"]
  connect() {
    // console.log("ciao");
    // console.log(this.sideTarget)

  }
  bar(e) {
    console.log(this.sideTarget);
    this.sideTarget.style.display = "block"

  }

}
