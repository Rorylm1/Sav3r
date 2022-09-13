const add_to = document.getElementsByClassName('basket')[0]

// console.log(add_to)


add_to.addEventListener('click', event => {

  setTimeout(function(){
    event.target.defaultValue = 'Add to Basket'
    event.target.style.backgroundColor = 'rgb(6,214,160)'
  }, 1000);


      event.target.defaultValue = 'Item Added';
      event.target.style.backgroundColor = 'darkgreen';


})
