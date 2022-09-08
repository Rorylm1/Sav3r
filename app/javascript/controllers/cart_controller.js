import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["cartjs"]
  connect() {
    // console.log("ciao");
    // console.log(this.sideTarget)

  }
  bar(e) {
    console.log(this.cartjsTarget);
    this.cartjsTarget.style.display = "block"

  }

}
