var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;

  $('.location-data').html('Your current position is:<br>' + 'Latitude : ' + crd.latitude +'<br>Longitude: ' + crd.longitude + '<br>More or less ' + crd.accuracy + ' meters.');
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};


$('.location').click(function(){
  navigator.geolocation.getCurrentPosition(success, error, options);
  console.log('this worked');
});