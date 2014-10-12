$(document).ready(function() {
 // initialize Isotope after all images have loaded
  var $grid = $('#grid').imagesLoaded( function() {
    $grid.isotope({
      // options
      itemSelector: '.event-item',
      layoutMode: 'masonry'
    });
  });

  $('.card-close').on('click').click(function(){
    $grid.isotope( 'remove', $(this).closest('.event-item') )
      // layout remaining item elements
      .isotope('layout');
    });

   $('.fav').on('click').click(function(){
    $(this).parent().html('<a class="btn btn-success" href="/profile"><i class="fa fa-star"></i> Favorited</a>')
    });

  $('.un-fav').on('click').click(function(){
    $grid.isotope( 'remove', $(this).closest('.event-item') )
      // layout remaining item elements
      .isotope('layout');
    });
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

  
  $(document).on('click', '.event-description', function() { $(this).children('.event-description-body').slideToggle('slow'); });


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
            
            success: function (result) {
             var $grid = $("#grid").imagesLoaded( function() {
              $grid.isotope({
                // options
                itemSelector: '.event-item',
                layoutMode: 'masonry'
              });
            });
              $('.card-close').on('click').click(function(){
              $grid.isotope( 'remove', $(this).closest('.event-item') )
                // layout remaining item elements
                .isotope('layout');
              });
            },
            error: function () {
                alert("error");
                $("#loading-status").text("ERROR...");
                $("#can-load-more").val("true");
            }
        });
        }else{
          //alert("cant do that..");
        };
      }
    })
});

});
