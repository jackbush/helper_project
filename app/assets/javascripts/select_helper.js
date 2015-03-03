
// // taking from bids table applicant_id and insterting it into the jobs table as helper id

function request(method, url, data){
	return $.ajax({
		url: url, 
		method: method, 
		dataType: "json",
		data: data
		})
}

// request("PUT", "/jobs/"+jobId, {job:{helper_id: helperId}}).done(function(reponse) {
//    console.log(reponse);
// 	})

function chooseHelpers() {
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

// this is a function to list all the helpers that have applied for this job

function listHelpers() {
	var jobId = $('#hidden-button').val();
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

 var trackCardTemplate = '<div class="track-card">';
        trackCardTemplate += '<h3 class="song-title">' + value.name + '</h3>';
        trackCardTemplate += '<img src="' + value.album.images[1].url + '" alt="">';
        trackCardTemplate += '<audio src="' + value.preview_url + '" controls></audio>';
        trackCardTemplate += '</div>';

// $('.js-choose_helper_table').append('<td>' + job.applicant.username + '</td>');
// $('.js-choose_helper_table').append('<td>' + job.note + '</td>');


$(document).ready(function() {

	console.log($('#hidden-button').val());
	listHelpers();

	$('.choose_helper_button').on('click', chooseHelpers)

});













