$(document).ready(function() {

  // declare some variables
  var searchForm = $('#search');
  var searchBox = $('#search-keyword');
  var dropdown = $('#search-type');
  var results = $('#results');

  // hook in to the submit action of my form
  searchForm.on('submit', search);

  // hook in to selecting a different dropdown value
  dropdown.on('change', search)


  function search(e) {
    // stop it doing what it wants and make it do what I WANT ME ME ME
    e.preventDefault();

    var searchType = $(':selected').val();

    // send an ajax request to spotify to find whatever I said in my input
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/search?q=' + searchBox.val() + '&type=' + searchType
    })
    .done(function(response) {
      results.html('');
      render(response, searchType);
    });
  }

  function render(response, searchType) {

    var data = response[searchType + 's'].items
    
    results.hide();


    // once I have the data back from spotify, put it inside of my results
    $.each(data, function(index, value) {
      if(searchType === 'track') {
        var trackCardTemplate = '<div class="track-card">';
        trackCardTemplate += '<h3 class="song-title">' + value.name + '</h3>';
        trackCardTemplate += '<img src="' + value.album.images[1].url + '" alt="">';
        trackCardTemplate += '<audio src="' + value.preview_url + '" controls></audio>';
        trackCardTemplate += '</div>';

        results.append(trackCardTemplate);
      } else {
        results.append('<li>' + value.name + '</li>');
      }
    })

    results.fadeIn('slow');
  }


});