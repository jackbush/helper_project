
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



$(document).ready(function() {

	$('.choose_helper_button').on('click', chooseHelpers)


	// $('.choose_helper_button').on('click', function(e) {
	// 		console.log($(this).data('helper-id'));		
	// });

});