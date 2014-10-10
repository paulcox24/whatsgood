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


  jQuery(function($) {
    $('.events-list').bind('scroll', function() {
        if($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight) {

        if ($("#can-load-more").val() == "true"){
        $("#can-load-more").val("false");
        $("#loading-status").text("loading more...");
        //alert(parseInt($("#page-number").val())+1);
        //var myData = { 'name': "derek" };
        $.ajax({
            data: {'page_number': parseInt($("#page-number").val())+1},
            url: '/static_pages/load_more_results',
            type: 'GET',
            
            /*success: function (result) {
                alert("yeah!!");
            },*/
            error: function () {
                alert("error");
                $("#loading-status").text("ERROR...");
                $("#can-load-more").val("true");
            }
        });
        }else{
          alert("cant do that..");
        };
      }
    })
});

});
