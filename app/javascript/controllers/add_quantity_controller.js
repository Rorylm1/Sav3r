import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-quantity"
export default class extends Controller {
  static targets = "form"
  connect() {
    console.log("hello")
  }

  add() {

  }
}
