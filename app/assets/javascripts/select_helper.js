// function request(method, url, data){
// 	return $.ajax({
// 		url: url, 
// 		method: method, 
// 		dataType: "json",
// 		data: data
// 		})
// }

function chooseHelper() {
	jobId = $(this).data('id');
	helperId = $(this).data('helper-id');
		$.ajax({
		url: "/jobs/"+jobId,
		method: "PUT",
		dataType: "json",
		data: {job:{helper_id: helperId}}
		}).done(function(reponse) {
   console.log(reponse);
	})
}

function listHelpers() {
	var jobId = $('#show-job-id').val();
	$.ajax({
		url: "/jobs/" + jobId + "/bids",
		method: "GET",
		dataType: "json",
	})
	.done(function(response) {
		$.each(response, function(index, job) {
		console.log(job);
		$('table.js-choose_helper_table').append('<tr>' + job.applicant.username + '</tr>');
		// $('table.js-choose_helper_table').append('<tr>' + job.note + '</tr>');
		})
	})
}

var applicantListItem = '<div class="applicant-list-item">';
   applicantListItem += '<h3 class="song-title">' + value.name + '</h3>';
   applicantListItem += '<img src="' + value.album.images[1].url + '" alt="">';
   applicantListItem += '<audio src="' + value.preview_url + '" controls></audio>';
   applicantListItem += '</div>';


$(document).ready(function() {
	console.log($('#show-job-id').val());
	listHelpers();

	$('#choose-helper-button').on('click', chooseHelper)
});