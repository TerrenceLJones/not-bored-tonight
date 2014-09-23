var coords;

function geoLocation() {
  if (navigator.geolocation) {
    var options = {enableHighAccuracy: true, timeout: 60000, maximumAge: 0};
    navigator.geolocation.getCurrentPosition( function (p) {
      var lat = p.coords.latitude * 1,
          lng = p.coords.longitude * 1;
      coords = [lat,lng];
      coords =  coords.join(',');
    },function (e){console.log(e), options});
  }
  else {
      alert('Geolocation is not supported by this browser.');
  }
}
