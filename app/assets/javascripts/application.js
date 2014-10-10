// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require underscore
//= require gmaps/google
//= require isotope.pkgd.min
//= require imagesloaded.pkgd.min
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
});

