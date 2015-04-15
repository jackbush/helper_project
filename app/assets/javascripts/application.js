//= require jquery
//= require jquery_ujs
//= require core
//= require map_styles
//= require map_functionality
//= require job_helper

$(document).ready(function() {
  if (window.location.pathname === '/jobs') {
    google.maps.event.addDomListener(window, 'load', initIndexMap)
  }
  if (window.location.pathname.match(/\/jobs\/\d/)) {
    google.maps.event.addDomListener(window, 'load', initShowMap)
  }
  findHelpers();
  // the below cannot target an element rendered by js -- target parent
  $('#choose-helper-button').on('click', chooseHelper);
});