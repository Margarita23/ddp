// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"

//= require jquery3
//= require popper
//= require bootstrap

console.log($('.defense_container'));

$( ".btn-create-defense" ).on( "click", function() {
    $( ".form_container" ).toggle("slow");
  });