// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"

//= require jquery3
//= require popper
//= require bootstrap

import './shevchenko.min.js';

async function declension(student) {
  const input = {
    // gender: 'masculine',
    // gender: 'feminine',
    gender: 'feminine',
    familyName: student.l_name,
    givenName: student.f_name,
    patronymicName: student.patronymic
  };

  let inGenitive = await shevchenko.inGenitive(input);
  let inNominative = await shevchenko.inNominative(input);
  let inDative = await shevchenko.inDative(input);

  const output = { 
    inGenitive: inGenitive.familyName + " " + inGenitive.givenName + " " + inGenitive.patronymicName,
    inNominative: inNominative.familyName + " " + inNominative.givenName + " " + inNominative.patronymicName,
    inDative: inDative.familyName + " " + inDative.givenName + " " + inDative.patronymicName,
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

function a () {
  let str1 = $( ".info.specification.specification_lfp" ).first().text();
  let studentArr = str1.split(' ');

  let student = {
    f_name: studentArr[1], 
    patronymic: studentArr[2],
    l_name: studentArr[0]
  }

  let res = declension(student).then(result => {
    $( ".info.specification.specification_lfp.genitive" ).html(result.inGenitive);
    $( ".info.specification.specification_lfp.nominative" ).html(result.inNominative);
    $( ".info.specification.specification_lfp.dative" ).html(result.inDative);

  }).catch((error) => console.error(error));

  

}

a();



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




  