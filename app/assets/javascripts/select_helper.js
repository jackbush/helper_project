function request(method, url, data) {
  return $.ajax({
    url: url,
    method: method,
    dataType: 'json',
    data: data
  })
}

function findHelpers() {
// debugger;
	var jobId = $('.job-id').text();
	request('GET', '/jobs/' + jobId, null)

	.done(function(response) {
		console.log(response)
		
		// 	if null
		// 		break;
		// 	else if (applicants)
		// 		renderApplicants(response)
		// 	else if (helper)
		// 		renderHelper(response)
	})
	.fail(function(error) {
		console.log(error)
	})
}

function renderApplicants(response) {
	  var data = response

		results.hide();
		results.val('');
    $.each(data, function(index, value) {
        var embeddedProfile = '<div class="embedded-profile">';

        embeddedProfile += '<div class="embedded-profile-image"><img src="' + value.image.url + '"></div>';
        embeddedProfile += '<div class="embedded-profile-stats">';
        embeddedProfile += '<h3>' + value.username + '</h3>';
        embeddedProfile += '<h4>' + value.date_time + '</h4>';
        embeddedProfile += '<h4>' + value.note + '</h4>';
        embeddedProfile += '<button id="#choose-helper-button" value="' + value.id + '">CHOOSE</button>';
        embeddedProfile += '</div></div>';

        results.append(embeddedProfile);
        results.fadeIn('slow');
    })
	.fail(function(error) {
		console.log(error)
	})
}

function renderHelper(response) {
	var data = response

		results.hide();
		results.val('');
    $.each(data, function(index, value) {
        var embeddedProfile = '<div class="embedded-profile">';

        embeddedProfile += '<div class="embedded-profile-image"><img src="' + value.image.url + '"></div>';
        embeddedProfile += '<div class="embedded-profile-stats">';
        embeddedProfile += '<h3>' + value.username + '</h3>';
        embeddedProfile += '<h4>' + value.date_time + '</h4>';
        embeddedProfile += '<h4>' + value.note + '</h4>';
        embeddedProfile += '</div></div>';

        results.append(embeddedProfile);
    results.fadeIn('slow');
    })
	.fail(function(error) {
		console.log(error)
	})
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

  var results = $('.job-show-helper');
  var results = $('.job-show-helper');
  var results = $('.job-show-helper');
  var results = $('.job-show-helper');
	
	findHelpers();
	
	$('#choose-helper-button').on('click', chooseHelper)

});