// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"

//= require jquery3
//= require popper
//= require bootstrap

$( ".btn-create-defense" ).on( "click", function() {
  $( ".form_container" ).toggle("slow");
});

$( ".btn-create-student" ).on( "click", function() {
  $( ".form_container" ).toggle("slow");
});

$( ".btn__add" ).on( "click", function() {
  $( ".form_container" ).toggle("slow");
  $( ".btn__reset, .btn__add" ).toggle("slow");
});

$( ".btn__reset" ).on( "click", function() {
  $( ".form_container" ).toggle("slow");
  $( ".btn__reset, .btn__add" ).toggle("slow");
});




  