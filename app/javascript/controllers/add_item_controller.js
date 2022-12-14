import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item"
export default class extends Controller {
  connect() {
    const add_to = document.getElementById('basket')
    add_to.addEventListener('click', event => {

      setTimeout(function(){
          event.target.defaultValue = 'Add to Basket'
          event.target.style.backgroundColor = 'rgb(6,214,160)'
        }, 1000);

            event.target.defaultValue = 'Item Added';
            event.target.style.backgroundColor = 'rgb(69, 206, 69)';

      })
  }
}
