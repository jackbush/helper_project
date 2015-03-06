function request(method, url, data) {
  return $.ajax({
    url: url,
    method: method,
    dataType: 'json',
    data: data
  })
}

function findHelpers() {
	var jobId = $('.job-id').text();
	request('GET', '/jobs/' + jobId, null)

	.done(function(response) {
		console.log(response)
			if (response === false)
				console.log('virgin')
			else if (response.applicants === true)
        renderApplicants(response)
			else if (response.helper === true)
				renderHelper(response)
	})
	.fail(function(error) {
		console.log(error)
	})
}

function renderApplicants(data) {
  var results = $('.job-show-helper');
  console.log(data)

	results.hide();
	results.text('');
  $.each(data, function(index, value) {
    var embeddedProfile = '<div class="embedded-profile">';

    embeddedProfile += '<div class="embedded-profile-image"><img src="' + value.image + '"></div>';
    embeddedProfile += '<div class="embedded-profile-stats">';
    embeddedProfile += '<h3>' + value.username + '</h3>';
    embeddedProfile += '<h4>' + value.date_time + '</h4>';
    embeddedProfile += '<h4>' + value.note + '</h4>';
    embeddedProfile += '<button id="#choose-helper-button" value="' + value.id + '">CHOOSE</button>';
    embeddedProfile += '</div></div>';

    results.append(embeddedProfile);
  })
  results.fadeIn('slow');
}

function renderHelper(data) {
  var results = $('.job-show-helper');
  console.log(data)

	results.hide();
	results.text('');
  $.each(data, function(index, value) {
    var embeddedProfile = '<div class="embedded-profile">';

    embeddedProfile += '<div class="embedded-profile-image"><img src="' + value.image + '"></div>';
    embeddedProfile += '<div class="embedded-profile-stats">';
    embeddedProfile += '<h3>' + value.username + '</h3>';
    embeddedProfile += '<h4>' + value.date_time + '</h4>';
    embeddedProfile += '<h4>' + value.note + '</h4>';
    embeddedProfile += '</div></div>';

    results.append(embeddedProfile);
  })
  results.fadeIn('slow');
}

function chooseHelper() {
	jobId = $(this).data('id');
	helperId = $(this).data('helper-id');
	request('PUT', '/jobs/'+jobId, {job:{helper_id: helperId}})
	.done(function(reponse) {
	  console.log(reponse);
	})
	findHelpers();
}

$(document).ready(function() {
	
	findHelpers();
	
	$('#choose-helper-button').on('click', chooseHelper)

});