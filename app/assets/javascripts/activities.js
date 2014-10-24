$(document).ready(function() {
	jQuery(function($) {
  $(this).bind('scroll', function() {
    if ($(".pagination").isOnScreen()) {

      var $next=$('.pagination .next_page a')
         $.getScript($next.attr('href'), function(){
              /* script has loaded*/
              $next.attr('href', function(i, currHref){
                 return currHref.replace(/(?!page\=)(\d)/, function(match){
                        return parseInt(match,10)+1;
                   });
              });
         });
      
    };

  });
  });
});