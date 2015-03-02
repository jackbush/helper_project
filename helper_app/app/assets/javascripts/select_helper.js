

// function chooseHelpers() {
// 	helper_id = bid.applicant.id
// 	$.ajax({
// 			url: '/jobs/(job id)', 
// 			type: 'PUT', 
// 			dataType: "json",
// 			data: {job:{helper_id: }}
// 			})
// 			.done(function(data) {
// 				console.log(data);
// 			});
// 	}


// // In the jobs controller under update 
// // def update
// // @
// // end


// function changeTaskStatus(){
// 	$this = $(this);
// 	taskId = $this.data("id");
// 	isDone = $this.is(":checked");
// 	request("PUT", "/tasks/"+taskId, {task:{done: isDone}}).done(function(){
// 		$this.parent().toggleClass("completed")
// 	})
// }
 
// write the code into edit job funciton to update the job
// get the bid.applicant_id to be entered in a hash into the 



$(document).ready(function() {



	$('#choose_helper_button').on('click', function(e) {
			console.log($(this).data('helper-id'));
	});



});