$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('#park').hide();
  $("#geolocate").on('click', function(){
    $('#park').fadeIn('medium',function(){})
  })

  $('#park').on('click', function(){

    var lat = myLayer._geojson.geometry.valueOf().coordinates[1];
    var lng = myLayer._geojson.geometry.valueOf().coordinates[0];

    $('#lat').attr('value', lat);
    $('#lng').attr('value', lng);
  })

});

/// Menu sidebar show ///

