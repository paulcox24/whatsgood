$(document).ready(function(){
	$("#tragdor").click(function(){
		$("#makeitso").addClass('say_welcome');
		$(".say_welcome").append("<span id=welcome>whatsgood</span>")
		$( ".say_welcome" ).fadeOut( 3120, function() {
    		// Animation complete.
  		});
	});
	$("#discobaby").click(function(){
		$("#letsmakeithappen").addClass('say_welcome');
		$(".say_welcome").append("<span id=welcometwo>whatsgood</span>")
		$( ".say_welcome" ).fadeOut( 1900, function() {
    		// Animation complete.
  		});
	});
});