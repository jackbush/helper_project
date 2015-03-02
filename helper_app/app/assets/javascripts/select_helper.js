

// // taking from bids table applicant_id and insterting it into the jobs table as helper id

// function chooseHelpers() {
// 	helper_id = bid.applicant.id
// 	$.ajax({
// 			url: '/jobs/+job-id', 
// 			type: 'PUT', 
// 			dataType: "json",
// 			data: {job:{helper_id: }}
// 			})
// 			.done(function(data) {
// 				console.log(data);
// 			});
// 	}


$(document).ready(function() {


	$('#choose_helper_button').on('click', function(e) {
			console.log($(this).data('helper-id')
			console.log$(this).data('job-id'));
	});



});