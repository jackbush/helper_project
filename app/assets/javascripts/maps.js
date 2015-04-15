var geocoder = new google.maps.Geocoder();

function smoothZoom(map, max, current) {
  if (current <= max) {
    var zoom = google.maps.event.addListener(map, 'zoom_changed', function(event){
      google.maps.event.removeListener(zoom);
      smoothZoom(map, max, current + 1);
    });
    setTimeout(function(){map.setZoom(current)}, 80);
  }
}

function centerOnUserLocation(map) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
       initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
       map.setCenter(initialLocation);
       smoothZoom(map, 13, 8);
    });
  }
}

function addMarkers(map) {
  var showMarkerFromGeocoderResults = function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var position = results[0].geometry.location
      var marker = new google.maps.Marker({
        map: map,
        position: position
      });
      map.setCenter(position);
    };
  };
  $('.address').each(function(index, element) {
    var geocoderOptions = { address: $(element).text() };
    geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults)
  });
}

function addInfoWindows(map) {

  var showMarkerFromGeocoderResults = function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var position = results[0].geometry.location
      var marker = new google.maps.Marker({
        map: map,
        position: position
      });
      map.setCenter(position);
    };
  };

  request('GET', '/jobs', 'json')
  .done(function(response){
    $.each(response, function(index, job){
      var geocoderOptions = { address: job.postcode };
      geocoder.geocode( geocoderOptions, showMarkerFromGeocoderResults)
    });

    // var marker = new google.maps.Marker({
    //   position: position,
    //   map: map,
    //   title: job.title
    // });

    // var infoWindowContent = '<div id="info-window-container">' + '<a href="/jobs/' + job.id + '"><h3>' + job.title + '</h3></a><p>' + job.description + '</p></div>';
    
    // var infowindow = new google.maps.InfoWindow({
    //   content: infoWindowContent
    // });
    
    // google.maps.event.addListener(marker, 'click', function() {
    //   $('*[id*=info-window-content]:visible').each(function() {
    //     $(this).parent().parent().parent().parent().hide();
    //   });
    //   infowindow.open(map, marker);
    // });
  });
};

function initIndexMap() {
  var mapOptions = {
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
  var map = new google.maps.Map(document.getElementById('jobs-index-map'), mapOptions);
  addInfoWindows(map);
  $('#by-location').on('click', function() {
    centerOnUserLocation(map);
  });
  $('#jobs-index-map-search').keypress(function(e) {
    if (e.which == 13) {
      var inputAddress = $('#jobs-index-map-search').val();
      $('#jobs-index-map-search').val('');
      var centerOnGeocoderResults = function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var position = results[0].geometry.location;
          map.setCenter(position);
        };
      };
      geocoder.geocode(inputAddress, centerOnGeocoderResults);
    };
  });
}

function initShowMap() {
  var mapOptions = {
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
  var map = new google.maps.Map(document.getElementById('job-show-map'), mapOptions);
  addMarkers(map);
}
