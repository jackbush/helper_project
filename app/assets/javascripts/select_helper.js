function request(method, url, data) {
  return $.ajax({
    url: url,
    method: method,
    dataType: 'json',
    data: data
  })
}

// this will be easier with more made available in controller

function listHelpers() {
	var jobId = $('#show-job-id').val();
	request('GET', '/jobs/' + jobId, null)
	.done(function(response) {
		debugger;
		// if helper !== null
		// 	// show helper
		// } else {
		// 	request('GET', '/jobs/' + jobId + '/bids', null)
		// 	.done(function(response) {
		// 		$.each(response, function(index, job) {
		// 			console.log(job);
		// 			// insert the below structure
		// 		})
		// 	})
		}).fail(function(error) {
			console.log(error)
		})
}

// var applicantListItem = '<div class="applicant-list-item">';
//    applicantListItem += image
//    applicantListItem += username
//    applicantListItem += datetime
//    applicantListItem += note
//    applicantListItem += button

// - if @job.helper
//       .job-show-helper
//         .embedded-profile
//           .embedded-profile-image
//             = image_tag(@job.helper.image)
//           .embedded-profile-stats
//             %h3= @job.helper.username
//             %h4= @job.helper.username

function chooseHelper() {
	jobId = $(this).data('id');
	helperId = $(this).data('helper-id');
	request('PUT', '/jobs/'+jobId, {job:{helper_id: helperId}})
	.done(function(reponse) {
	  console.log(reponse);
	})
	showHelper();
}

$(document).ready(function() {
	listHelpers();
	$('#choose-helper-button').on('click', chooseHelper)
});