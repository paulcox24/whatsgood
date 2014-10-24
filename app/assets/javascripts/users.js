$(document).ready(function() {
  $(".feed-box").css("height", $(".profile").height()-48);

var $profile_feed_can_load_more = $("#profile-feed-can-load-more");

jQuery(
  function($)
  {
    $('.feed-box').bind('scroll', function()
      {
        if($(this).scrollTop() + $(this).innerHeight()>=$(this)[0].scrollHeight - 100)
        {
          if ($('.pagination').length && $profile_feed_can_load_more.val() == "true" && $(".pagination").isOnScreen()) {
	      $profile_feed_can_load_more.val("false");
	      $.getScript($('.pagination .next_page').attr('href'));
	    };
        }
      })
  }
);
});

