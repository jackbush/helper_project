
// // taking from bids table applicant_id and insterting it into the jobs table as helper id

function request(method, url, data){
	return $.ajax({
		url: url, 
		method: method, 
		dataType: "json",
		data: data
		})
}

function chooseHelpers() {
	jobId = $(this).data('id');
	helperId = $(this).data('helper-id');
	request("PUT", "/jobs/"+jobId, {job:{helper_id: helperId}}).done(function(){
	})
}

$(document).ready(function() {

	$('#choose_helper_button').on('click', chooseHelpers)


	$('#choose_helper_button').on('click', function(e) {
			console.log($(this).data('id'));		
	});

});