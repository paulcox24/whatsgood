$(document).ready(function() {
 // initialize Isotope after all images have loaded
  var $grid = $('#grid').imagesLoaded( function() {
    $grid.isotope({
      // options
      itemSelector: '.event-item',
      layoutMode: 'masonry'
    });
    function onLayout() {
      $( ".events-list" ).scroll();
    }
    // bind event listener
    $grid.isotope( 'on', 'layoutComplete', function() {
      setTimeout(function (){

             $( ".events-list" ).scroll();//something you want delayed

         }, 10); 
      
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

  $('#cat-boxes').change(function(){
    var catList = "";
    $('#cat-boxes input:checked').each(function() {
        catList = $(this).attr('value');
    });
    $grid.isotope({ filter: catList });
  });

  $.fn.isOnScreen = function(){
    
    var win = $(window);
    
    var viewport = {
        top : win.scrollTop(),
        left : win.scrollLeft()
    };
    viewport.right = viewport.left + win.width();
    viewport.bottom = viewport.top + win.height();
    
    var bounds = this.offset();
    bounds.right = bounds.left + this.outerWidth();
    bounds.bottom = bounds.top + this.outerHeight();
    
    return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));
    
  };
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

  
jQuery(function($) {
  $('.events-list').bind('scroll', function() {

        if($("#cards-bottom").isOnScreen()) {
        if ($("#can-load-more").val() == "true"){
        $("#can-load-more").val("false");
        $("#loading-status").text("loading more...");
        //alert(parseInt($("#page-number").val())+1);
        //var myData = { 'name': "derek" };
        $.ajax({
            data: {'page_number': parseInt($("#page-number").val())+1, 'search_date': $('#search-date').val() },
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
               $('.fav').on('click').click(function(){
                $(this).parent().html('<a class="btn btn-success" href="/profile"><i class="fa fa-star"></i> Favorited</a>')
                });

              $('.un-fav').on('click').click(function(){
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
