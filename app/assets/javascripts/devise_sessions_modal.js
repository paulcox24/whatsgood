$(document).ready(function(){
	$("#tragdor").click(function(){
		$("#makeitso").addClass('say_welcome');
		$(".say_welcome").append("<span id=welcome>welcome to whatsgood!</span>")
	});
});