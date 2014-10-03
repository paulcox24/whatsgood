$(document).ready(function() {

  var options = {
    enableHighAccuracy: true,
    maximumAge: 0
  };

  function success(pos) {
    var coord = pos.coords;
    geocoder = new google.maps.Geocoder();
    $('#user_longitude').val(coord.longitude);
    $('#user_latitude').val(coord.latitude);

    var latlng = new google.maps.LatLng(coord.latitude,coord.longitude);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          $('#user_address').val(results[0].formatted_address);
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
      $('#location_button').button('reset');
    });
    

    // $('.location-data').html('Your current position is:<br>' + 'Latitude : ' + crd.latitude +'<br>Longitude: ' + crd.longitude + '<br>More or less ' + crd.accuracy + ' meters.');
  };


  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };


  $('#location_button').click(function(){
    var btn = $(this);
    btn.button('loading');
    navigator.geolocation.getCurrentPosition(success, error, options);
    console.log('this worked');
  });
});