function request(method, url, data){
	return $.ajax({
		url: url, 
		method: method, 
		dataType: "json",
		data: data
		})
}

function appendData(task){
	$('<li class="'+ (task.done == true ? "completed" : "") + '">'+
  '<input class="toggle" type="checkbox" data-id="'+ task.id +'" '+ (task.done == true ? 'checked="checked"' : "") + '>'+
  '<label>'+ task.title +'</label>'+
  '<button class="destroy" data-id="'+ task.id +'"></button>'+
	'</li>').prependTo("#todo-list");
}

function getTasks(){
	request("GET", "/tasks", null).done(function(data){
		$.each(data, function(i, task){
		appendData(task)		
		})		
	});
}

function createTask(){
	request("POST", "/tasks", {task:{title: $("#new-todo").val()}}).done(function(data){
	appendData(data)
	$("#new-todo").val("")		
	})
}

function destroyTask(){
	$this = $(this);
	taskId = $this.data("id");
	request("DELETE", "/tasks/" +taskId, null).done(function(){
		$this.parent().remove()
	})
}

function changeTaskStatus(){
	$this = $(this);
	taskId = $this.data("id");
	isDone = $this.is(":checked");
	request("PUT", "/tasks/"+taskId, {task:{done: isDone}}).done(function(){
		$this.parent().toggleClass("completed")
	})
}

$(function(){
	$("#new-todo").on('keypress', function(e){
		if(e.which == "13"){ createTask()
		}
	})
	getTasks();
	$("#todo-list").on('click', ".destroy", destroyTask);
	$("#todo-list").on('change', ".toggle", changeTaskStatus);
});

 // console.table(data);