$(document).ready(function() {

$("#jobs-index-list").hide()

$('button#toggle-index-map-list').click(function() {
  $("#jobs-index-map").toggleClass('hide-index-map');
  $("#jobs-index-list").toggle();
});

});