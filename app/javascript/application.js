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

$( ".btn_enter-manually, .btn_enter-from-list" ).on( "click", function() {
  $( ".manual" ).toggle("slow");
  $( ".from-list" ).toggle("slow");
});
  