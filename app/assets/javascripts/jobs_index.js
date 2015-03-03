$(document).ready(function() {

$("#job-index-map").hide()

$('button#toggle').click(function() {
  $("#job-index-map").toggle();
  $(".well").toggle();
});

});