$(document).on('turbolinks:load', function() {
  $('.play').on('click',function(){
    index = $('.play').index(this)
    // console.log(this)
    $element = document.getElementsByClassName("record")[index]
    setTimeout( function() {
      $element.classList.add('load');
    }, 1000);
  });

  $('.pause').on('click',function(){
    index = $('.pause').index(this)
    $element = document.getElementsByClassName("record")[index]
    setTimeout( function() {
      $element.classList.remove('load');
    }, 2000);
  });
});
