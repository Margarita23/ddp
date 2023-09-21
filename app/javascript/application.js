// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"

//= require jquery3
//= require popper
//= require bootstrap

import './shevchenko.min.js';

async function main() {
  const input = {
    gender: 'masculine',
    givenName: 'Тарас',
    patronymicName: 'Григорович',
    familyName: 'Шевченко'
  };

  let inGenitive = Object.values(await shevchenko.inGenitive(input)).join(' ');
  let inNominative = Object.values(await shevchenko.inNominative(input)).join(' ');
  let inDative = Object.values(await shevchenko.inDative(input)).join(' ');

  const output = { 
    inGenitive,
    inNominative,
    inDative
   };

  // inAblative (орудний)
  // inAccusative (знахідний)
  // inDative (давальний)
  // inGenitive (родовий відмінок)
  // inLocative (місцевий)
  // inNominative (називний)
  // inVocative (кличний)

  return output;
}

main().then(r => console.log(r)).catch((error) => console.error(error))


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




  