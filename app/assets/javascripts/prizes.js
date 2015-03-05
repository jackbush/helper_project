$(document).ready(function() {

$("p.prize-info").hide()

$('button.learn-more').click(function() {
  $("p.prize-info").toggle();
});

$('button.gold-button').click(function() {
  // $( ".well.prize-index:contains('gold')" ).toggle();
  $( ".well.prize-index[value='silver']" ).toggle();
  $( ".well.prize-index[value='bronze']" ).toggle();
});

$('button.silver-button').click(function() {
  $( ".well.prize-index[value='silver']" ).toggle();
});

$('button.bronze-button').click(function() {
  $( ".well.prize-index[value='bronze']" ).toggle();
});



$( ".well.prize-index[value='gold']" ).css({ "border-color": "gold", "border-width": "5px" });
$( ".well.prize-index[value='silver']" ).css({ "border-color": "silver", "border-width": "5px" });
$( ".well.prize-index[value='bronze]" ).css({ "border-color": "bronze", "border-width": "5px" });

});

