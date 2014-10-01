var options = {
  enableHighAccuracy: true,
  maximumAge: 0
};

function success(pos) {
  var coord = pos.coords;
  $('#user_longitude').val(coord.longitude);
  $('#user_latitude').val(coord.latitude);
  // $('.location-data').html('Your current position is:<br>' + 'Latitude : ' + crd.latitude +'<br>Longitude: ' + crd.longitude + '<br>More or less ' + crd.accuracy + ' meters.');
};


function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};


$('#location_button').click(function(){
  navigator.geolocation.getCurrentPosition(success, error, options);
  console.log('this worked');
});