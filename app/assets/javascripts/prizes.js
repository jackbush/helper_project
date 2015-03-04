$(document).ready(function() {

$("p.prize-info").hide()

$('button.learn-more').click(function() {
  $("p.prize-info").toggle();
});

});


// $("#jobs-index-list").hide()
// // hide the list of jobs on page load
// $('button#toggle-index-map-list').click(function() {
//   $("#jobs-index-map-container").toggleClass('hide-index-map');
//   $("#jobs-index-list").toggle();
// });
// // click on a button to 
// // 