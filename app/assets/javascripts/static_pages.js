$(document).ready(function() {
  //variables
  var user = $('#current-user').val();
  var $bottom_screen = $("#cards-bottom");
  var $can_load_more = $("#can-load-more");
  var $page_number = $("#page-number");
  var $total_pages = $("#total-pages");
  var $loading_status = $("#loading-status");
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
          $( ".events-list" ).scroll();
         }, 10); 
    });
  });

  $grid.on('click', '.card-close', function(){
    $grid.isotope( 'remove', $(this).closest('.event-item') ).isotope('layout');
  });

  $grid.on('click', '.fav', function(){
    $(this).parent().html('<a class="btn btn-success" href="/users/'+user+'/profile"><i class="fa fa-star"></i> Favorited</a>');
  });

  $grid.on('click', '.un-fav', function(){
    $grid.isotope( 'remove', $(this).closest('.event-item') ).isotope('layout');
  });

  $('#cat-boxes').change(function(){
    $('#cat-boxes input:checked').each(function() {
      $grid.isotope({ filter: $(this).attr('value') });
    });
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
  var options = {
    enableHighAccuracy: true,
    maximumAge: 0
  };

  function success(pos) {
    var coord = pos.coords;
    console.log(coord.latitude);
    console.log(coord.longitude);
    $.ajax({
      type: 'GET',
      url: '/static_pages/get_current_location',
      data: {latitude: coord.latitude, longitude: coord.longitude}
    });
  };

  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };
 
  $('#good-button').click(function(){
    navigator.geolocation.getCurrentPosition(success, error, options);
    console.log('this worked');
  });

  
jQuery(function($) {
  $('.events-list').bind('scroll', function() {

        if($bottom_screen.isOnScreen()) {
        if ($can_load_more.val() == "true" && parseInt($page_number.val())+1 <= parseInt($total_pages.val())){
        $can_load_more.val("false");
        $loading_status.show();
        $.ajax({
            data: {'page_number': parseInt($page_number.val())+1, 'search_date': $('#search-date').val() },
            url: '/static_pages/load_more_results',
            type: 'GET',
            success: function (result) {
              $grid = $('#grid').imagesLoaded( function() {
                $loading_status.hide();
                $grid.isotope({
                  // options
                  itemSelector: '.event-item',
                  layoutMode: 'masonry'
                });
              });
            },
            error: function () {
              $can_load_more.val("false");
              $loading_status.text("No More Results Found");
              setTimeout(function(){
                  $loading_status.fadeOut("slow");
              },2000)
            }
        });
        }else{
          //alert("cant do that..");
        };
      }
    })
});

});
