// function addMarker(map) {
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

function initIndexMap() {
  var mapOptions = {
    center: new google.maps.LatLng(51.519889, -0.068799),
    zoom: 10,
    // style
  };
  var map = new google.maps.Map(document.getElementById('job-index-map'), mapOptions);
  // addMarker(map);
}

if (window.location.pathname === '/jobs') {
  google.maps.event.addDomListener(window, 'load', initIndexMap)
}
