// function addMarker(map) {
//   // console.log('showing the marker from geocode')
//   var geocoder = new google.maps.Geocoder();
//   var showMarkerFromGeocoderResults = function(results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//       var position = results[0].geometry.location
//       var marker = new google.maps.Marker({
//         map: map,
//         position: position
//       });
//       map.setCenter(position);
//     } else {
//       console.log(status);
//     }
//   };
//   $('address').each(function(index, element) {
//     var geocoderOptions = { address: $(element).text() };
//   geocoder.geocode( geocoderOptions, showMarkerFromGeocoderResults)
//   });
// }

function initMap() {
  var mapOptions = {
    center: new google.maps.LatLng(51.519889, -0.068799),
    zoom: 16,
    styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}],
    // mapTypeId: 'satellite'
  };
  var map = new google.maps.Map(document.getElementById('job-show-map'), mapOptions);
  // addMarker(map);
}

google.maps.event.addDomListener(window, 'load', initMap)