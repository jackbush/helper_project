var mapStyle = [{
  "featureType": "administrative",
  "elementType": "all",
  "stylers": [{
    "visibility": "off"
  }]
}, {
  "featureType": "administrative",
  "elementType": "labels",
  "stylers": [{
    "visibility": "on"
  }]
}, {
  "featureType": "landscape",
  "elementType": "all",
  "stylers": [{
    "visibility": "simplified"
  }, {
    "hue": "#0066ff"
  }, {
    "saturation": 74
  }, {
    "lightness": 100
  }]
}, {
  "featureType": "poi",
  "elementType": "all",
  "stylers": [{
    "visibility": "simplified"
  }]
}, {
  "featureType": "road",
  "elementType": "all",
  "stylers": [{
    "visibility": "simplified"
  }]
}, {
  "featureType": "road.highway",
  "elementType": "all",
  "stylers": [{
    "visibility": "off"
  }, {
    "weight": 0.6
  }, {
    "saturation": -85
  }, {
    "lightness": 61
  }]
}, {
  "featureType": "road.highway",
  "elementType": "geometry",
  "stylers": [{
    "visibility": "on"
  }]
}, {
  "featureType": "road.arterial",
  "elementType": "all",
  "stylers": [{
    "visibility": "off"
  }]
}, {
  "featureType": "road.local",
  "elementType": "all",
  "stylers": [{
    "visibility": "on"
  }]
}, {
  "featureType": "transit",
  "elementType": "all",
  "stylers": [{
    "visibility": "simplified"
  }]
}, {
  "featureType": "water",
  "elementType": "all",
  "stylers": [{
    "visibility": "simplified"
  }, {
    "color": "#5f94ff"
  }, {
    "lightness": 26
  }, {
    "gamma": 5.86
  }]
}];

var indexMapOptions = {
  center: new google.maps.LatLng(51.519889, -0.068799),
  zoom: 10,
  styles: mapStyle,
  panControl: false,
  zoomControl: true,
  mapTypeControl: false,
  scaleControl: false,
  streetViewControl: false,
  overviewMapControl: false
};

var showMapOptions = {
  center: new google.maps.LatLng(51.519889, -0.068799),
  zoom: 15,
  styles: mapStyle,
  scrollwheel: false,
  panControl: false,
  zoomControl: true,
  mapTypeControl: false,
  scaleControl: false,
  streetViewControl: true,
  overviewMapControl: false
};

function smoothZoom(map, max, current) {
  if (current <= max) {
    var zoom = google.maps.event.addListener(map, 'zoom_changed', function(event){
      google.maps.event.removeListener(zoom);
      smoothZoom(map, max, current + 1);
    });
    setTimeout(function(){map.setZoom(current)}, 80);
  };
};