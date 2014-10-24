$(document).ready(function() {
  var $feed_can_load_more = $("#feed-can-load-more");

	jQuery(function($) {
  $(this).bind('scroll', function() {
    if ($('.pagination').length && $feed_can_load_more.val() == "true" && $(".pagination").isOnScreen()) {
      $feed_can_load_more.val("false");
      $.getScript($('.pagination .next_page').attr('href'));
    };

  });
  });
});