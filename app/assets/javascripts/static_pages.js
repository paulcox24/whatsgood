$(document).ready(function() {

//   var options = {
//     enableHighAccuracy: true,
//     maximumAge: 0
//   };

//   function success(pos) {
//     var coord = pos.coords;
//     console.log(coord.latitude);
//     console.log(coord.longitude);
//     $('.events-list').removeClass('hidden'); 

//   };

//   function error(err) {
//     console.warn('ERROR(' + err.code + '): ' + err.message);
//   };
 
//   $('#good_button').click(function(){
//     navigator.geolocation.getCurrentPosition(success, error, options);
//     console.log('this worked');
//   });

  

  $('.event-description').unbind('click').click(function(){
    $(this).children('.event-description-body').slideToggle('slow');
  });

  $(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() == $(document).height()) {
       alert("bottom!");
    }
	});

});
