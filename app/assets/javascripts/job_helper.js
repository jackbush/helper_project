function renderApplicants(data) {
  var results = $('.job-show-helper');
	results.hide();
	results.text('');
  $.each(data, function(index, value) {
    if (value !== true) {
      var embeddedProfile  = '<div class="embedded-profile">';
          embeddedProfile += '<div class="embedded-profile-image"><img src="' + value.applicant_image + '"></div>';
          embeddedProfile += '<div class="embedded-profile-stats">';
          embeddedProfile += '<h3><a href="/users/' + value.applicant_id + '">' + value.applicant_name + '</a></h3>';
          embeddedProfile += '<h4>' + value.offer_time + '</h4>';
          embeddedProfile += '<p>' + value.note + '</p>';
          embeddedProfile += '<button id="choose-helper-button" data-helper-id="' + value.applicant_id + '" data-helper-datetime="' + value.datetime + '">CHOOSE</button>';
          embeddedProfile += '</div></div>';
      results.append(embeddedProfile);
    }
  });
  results.fadeIn('slow');
};

function renderHelper(data) {
  var results = $('.job-show-helper');
	results.hide();
	results.text('');
  var embeddedProfile  = '<div class="embedded-profile">';
      embeddedProfile += '<div class="embedded-profile-image"><img src="' + data.helper_image + '"></div>';
      embeddedProfile += '<div class="embedded-profile-stats">';
      embeddedProfile += '<h3>' + data.helper_name + '</h3>';
      embeddedProfile += '<h4>ASSIGNED HELPER</h4>';
      embeddedProfile += '</div></div>';
  results.append(embeddedProfile);
  results.fadeIn('slow');
}

function findHelpers() {
  var jobId = $('.job-id').text();
  request('GET', '/jobs/' + jobId, null)
  .done(function(response) {
    if (response.applicants === true)
      renderApplicants(response);
    else if (response.helper === true)
      renderHelper(response);
  })
  .fail(function(error) {
    console.log(error);
  });
};

function chooseHelper() {
	var jobId = $('.job-id').text();
	helperId = $(this).data('helper-id');
  helperTime = $(this).data('helper-datetime');
	request('PUT', '/jobs/'+jobId, {job:{helper_id: helperId, date_time: helperTime}})
	.done(function() {
	  findHelpers();
	})
  .fail(function(error) {
    console.log(error);
  });
};